package main

const: {
	// +usage=The const name of the resource
	name: "airbyte-operator"
	// +usage=The namespace of the addon application
	namespace: "vela-system"
}

parameter: {
	image:           *"h7kanna/airbyte-replication-operator" | string
	imagePullPolicy: *"Always" | "Never" | "IfNotPresent"
	imagePullSecret: *"regcred" | string
	version:         *"0.0.1" | string
	resources: {
		requests: {
			cpu:    *"100m" | string
			memory: *"64Mi" | string
		}
		limits: {
			cpu:    *"500m" | string
			memory: *"256Mi" | string
		}
	}
}
