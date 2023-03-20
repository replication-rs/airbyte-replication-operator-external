package main

const: {
	// +usage=The const name of the resource
	name: "minio"
	// +usage=The namespace of the addon application
	namespace: "vela-system"
}

parameter: {
	// +usage=Minio admin user
	user: *"minio" | string
	// +usage=Minio admin password
	password: *"miniostorage" | string
	// +usage=Minio image
	image: *"minio/minio:latest" | string
	// +usage=Service type
	serviceType: *"ClusterIP" | "NodePort" | "LoadBalancer"
	// +usage=Access Minio API from this port
	apiPort: *9000 | int
	// +usage=Access Minio Console from this port
	consolePort: *9090 | int
	// +usage=Settings related to persisting data. You only need this if you are using local storage.
	persistence: {
		// +usage=Persist Minio data to PV. PVC will be created automatically. Specify a pvcName to prevent that.
		enabled: *true | bool
		// This is commented out because I haven't found a way to specify policies.
		// Keep automatically created PVC even if addon is deleted.
		// alwaysKeep: *false | bool
		// +usage=Use an existing PVC. If you specify this, PVC will NOT be created automatically.
		pvcName?: string
	}
}
