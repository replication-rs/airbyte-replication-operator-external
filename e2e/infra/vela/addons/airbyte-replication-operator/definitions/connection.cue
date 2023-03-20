connection: {
	annotations: {}
	attributes: workload: type: "autodetects.core.oam.dev"
	description: "Airbyte replicaion connection"
	labels: {}
	type: "component"
}

template: {
	output: {
		apiVersion: "airbyte.pravaah.dev/v1alpha1"
		kind:       "Connection"
		metadata: {
			name:      context.name
			namespace: context.namespace
		}
		spec: {
			sourceRef: {
				name:      parameter.sourceRef
				namespace: *context.namespace | string
			}
			destinationRef: {
				name:      parameter.destinationRef
				namespace: *context.namespace | string
			}
			schedule: {
				units:    *1 | int
				timeUnit: *"minutes" | string
			}
			scheduleType: *"manual" | string
		}
	}
	outputs: {}
	parameter: {
		sourceRef:      string
		destinationRef: string
	}
}
