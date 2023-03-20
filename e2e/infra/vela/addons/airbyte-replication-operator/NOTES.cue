info: string

info: """
	By default, the \(const.name) app is strictly serving in the domain `127.0.0.1:7007`, check it by:

	    vela port-forward addon-\(const.name) -n vela-system

	You can build your own \(const.name) app if you want to use it in other domains.
	"""

notes: (info)
