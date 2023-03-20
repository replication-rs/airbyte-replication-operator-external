package main

import "encoding/json"

resourceTopology: {
	type: "k8s-objects"
	name: "airbyte-topology"
	properties: objects: [{
		apiVersion: "v1"
		kind:       "ConfigMap"
		metadata: {
			name:      "\(const.name)-topology"
			namespace: const.namespace
			labels: {
				"rules.oam.dev/resources":       "true"
				"rules.oam.dev/resource-format": "json"
			}
		}
		data: rules: json.Marshal([{
			parentResourceType: {
				group: "airbyte.pravaah.dev"
				kind:  "Connection"
			}
			childrenResourceType: [
				{
					apiVersion: "airbyte.pravaah.dev/v1alpha1"
					kind:       "Replication"
				},
			]
		}, {
			parentResourceType: {
				group: "airbyte.pravaah.dev"
				kind:  "Replication"
			}
			childrenResourceType: [
				{
					apiVersion: "batch/v1"
					kind:       "Job"
				},
				{
					apiVersion: "airbyte.pravaah.dev/v1alpha1"
					kind:       "ReplicationOutput"
				},
				{
					apiVersion: "v1"
					kind:       "Pod"
				},
			]
		}])
	}]}
