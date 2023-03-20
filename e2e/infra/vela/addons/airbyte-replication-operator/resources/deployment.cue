package main

deployment: {
	type: "k8s-objects"
	name: "airbyte-deployment"
	properties: objects: [{
		apiVersion: "v1"
		kind:       "Service"
		metadata: {
			name:      const.name
			namespace: const.namespace
			labels: app: const.name
		}
		spec: {
			ports: [{
				port:       80
				targetPort: 8080
				protocol:   "TCP"
				name:       "http"
			}]
			selector: app: const.name
		}
	}, {
		apiVersion: "apps/v1"
		kind:       "Deployment"
		metadata: {
			name:      const.name
			namespace: const.namespace
			labels: app: const.name
		}
		spec: {
			replicas: 1
			selector: matchLabels: app: const.name
			template: {
				metadata: {
					labels: app: const.name
					annotations: {
						"prometheus.io/scrape": "true"
						"prometheus.io/port":   "8080"
					}
				}
				spec: {
					serviceAccountName: const.name
					imagePullSecrets: [{
						name: parameter.imagePullSecret
					}]
					containers: [{
						name:            const.name
						image:           "\(parameter.image):\(parameter.version)"
						imagePullPolicy: parameter.imagePullPolicy
						resources: {
							limits: {
								cpu:    parameter.resources.limits.cpu
								memory: parameter.resources.limits.memory
							}
							requests: {
								cpu:    parameter.resources.requests.cpu
								memory: parameter.resources.requests.memory
							}
						}
						ports: [{
							name:          "http"
							containerPort: 8080
							protocol:      "TCP"
						}]
						env: [{
							// We are pointing to tempo or grafana tracing agent's otlp grpc receiver port
							name:  "OPENTELEMETRY_ENDPOINT_URL"
							value: "https://promstack-tempo.monitoring.svc.cluster.local:4317"
						}, {
							name:  "RUST_LOG"
							value: "info,kube=debug,controller=debug"
						}]
						readinessProbe: {
							httpGet: {
								path: "/health"
								port: "http"
							}
							initialDelaySeconds: 5
							periodSeconds:       5
						}
					}]
				}
			}
		}
	}]
}
