package main

output: {
	apiVersion: "core.oam.dev/v1beta1"
	kind:       "Application"
	spec: {
		components: [
			crd,
			rbac,
			deployment,
			resourceTopology,
		]
		policies: [
			{
				type: "shared-resource"
				name: "shared-resource"
				properties: rules: [{
					selector: resourceTypes: ["CustomResourceDefinition", "ServiceAccount", "ClusterRoleBinding", "ClusterRole", "Deployment", "Service"]
				}]
			},
			{
				type: "take-over"
				name: "take-over-resource"
				properties: rules: [{
					selector: resourceTypes: ["CustomResourceDefinition", "ServiceAccount", "ClusterRoleBinding", "ClusterRole", "Deployment", "Service"]
				}]
			},
			{
				type: "garbage-collect"
				name: "not-gc-CRD"
				properties: {
					rules: [{
						selector: resourceTypes: ["CustomResourceDefinition"]
						strategy: "never"
					},
					]
				}
			},
		]
	}
}
