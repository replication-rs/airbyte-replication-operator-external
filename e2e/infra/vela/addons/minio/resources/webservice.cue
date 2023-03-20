package main

#envs: {
	MINIO_ROOT_USER:     parameter.user
	MINIO_ROOT_PASSWORD: parameter.password
}

#traitsAll: [
	{
		enabled: true
		type:    "storage"
		properties: {
			if !parameter.persistence.enabled {
				emptyDir: [{
					name:      "minio-local-storage"
					mountPath: "/data"
				}]
			}
			if parameter.persistence.enabled {
				pvc: [{
					if parameter.persistence.pvcName != _|_ {
						name:      parameter.pvcName
						mountOnly: true
					}
					if parameter.persistence.pvcName == _|_ {
						name: "minio-local-storage"
					}
					mountPath: "/data"
				}]
			}
		}
	},
	{
		enabled: true
		type:    "env"
		properties: {
			env: {
				for k, v in #envs if v != _|_ if v != "" {
					"\(k)": v
				}
			}
		}
	},
]

webservice: {
	name: "minio-service"
	type: "webservice"
	properties: {
		image: parameter.image
		args: ["server", "--address", "0.0.0.0:9000", "--console-address", "0.0.0.0:9090", "/data"]
		imagePullPolicy: "IfNotPresent"
		ports: [
			{
				name:   "api"
				port:   parameter.apiPort
				expose: true
			},
			{
				name:   "console"
				port:   parameter.consolePort
				expose: true
			},
		]
		exposeType: parameter.serviceType
		livenessProbe: {
			exec: {
				command: ["curl", "-f", "http://localhost:9000/minio/health/live"]
			}
			initialDelaySeconds: 5
			periodSeconds:       30
			timeoutSeconds:      20
		}
	}
	traits: [
		for t in #traitsAll if t.enabled {
			t
		},
	]
}
