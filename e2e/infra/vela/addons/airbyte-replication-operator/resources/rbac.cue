package main

rbac: {
	type: "k8s-objects"
	name: "airbyte-rbac"
	properties: objects: [
		{
			apiVersion: "v1"
			kind:       "ServiceAccount"
			metadata: {
				name:      const.name
				namespace: const.namespace
			}
			automountServiceAccountToken: true
		},
		{
			kind:       "ClusterRole"
			apiVersion: "rbac.authorization.k8s.io/v1"
			metadata: name: "control-airbyte-replications"
			rules: [{
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["connectordefinitions", "connectordefinitions/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["connectors", "connectors/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["connections", "connections/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["replications", "replications/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["replicationoutputs", "replicationoutputs/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: [""]
				resources: ["configmaps"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: [""]
				resources: ["pods", "pods/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["batch"]
				resources: ["jobs", "jobs/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["coordination.k8s.io"]
				resources: [
					"leases",
				]
				verbs: [
					"get",
					"list",
					"watch",
					"create",
					"update",
					"patch",
					"delete",
				]
			}, {
				apiGroups: ["events.k8s.io"]
				resources: ["events"]
				verbs: [
					"get",
					"list",
					"watch",
					"create",
					"update",
					"patch",
					"delete",
				]
			}]

		},
		{
			kind:       "ClusterRoleBinding"
			apiVersion: "rbac.authorization.k8s.io/v1"
			metadata: name: "\(const.name)-binding"
			subjects: [{
				kind:      "ServiceAccount"
				namespace: const.namespace
				name:      const.name
			}]
			roleRef: {
				kind:     "ClusterRole"
				name:     "control-airbyte-replications"
				apiGroup: "rbac.authorization.k8s.io"
			}
		},
		{
			apiVersion: "v1"
			kind:       "ServiceAccount"
			metadata: {
				name:      "airbyte-replication-driver"
				namespace: "default"
			}
			automountServiceAccountToken: true
		}, {
			kind:       "ClusterRole"
			apiVersion: "rbac.authorization.k8s.io/v1"
			metadata: name: "control-airbyte-replication-outputs"
			rules: [{
				apiGroups: ["airbyte.pravaah.dev"]
				resources: ["replicationoutputs/status"]
				verbs: [
					"get",
					"create",
					"update",
					"delete",
					"patch",
					"watch",
					"list",
				]
			}, {
				apiGroups: ["coordination.k8s.io"]
				resources: [
					"leases",
				]
				verbs: [
					"get",
					"list",
					"watch",
					"create",
					"update",
					"patch",
					"delete",
				]
			}, {
				apiGroups: ["events.k8s.io"]
				resources: ["events"]
				verbs: [
					"get",
					"list",
					"watch",
					"create",
				]
			}]
		}, {
			kind:       "ClusterRoleBinding"
			apiVersion: "rbac.authorization.k8s.io/v1"
			metadata: name: "airbyte-replication-driver-binding"
			subjects: [{
				kind:      "ServiceAccount"
				namespace: "default"
				name:      "airbyte-replication-driver"
			}]
			roleRef: {
				kind:     "ClusterRole"
				name:     "control-airbyte-replication-outputs"
				apiGroup: "rbac.authorization.k8s.io"
			}
		},
	]
}
