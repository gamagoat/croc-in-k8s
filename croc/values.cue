// Note that this file must have no imports and all values must be concrete.

@if(!debug)

package main

values: {
	image: {
		repository: "schollz/croc"
		digest:     "sha256:291de5764674de3687d95c855565c36f4bf8111030b1488186758b2d64d173e5"
		tag:        "10"
	}

	_commport: port: 9009
	_commport: name: "communication"

	_txport: port: 9010
	_txport: name: "datatx"

	service: ports: [
		{
			name:       _commport.name
			port:       _commport.port
			protocol:   "TCP"
			targetPort: name
		},
		{
			name:       _txport.name
			port:       _txport.port
			protocol:   "TCP"
			targetPort: name
		},
	]

	container: {
		command: ["/croc", "--debug", "relay"]

		ports: [
			{
				name:          _commport.name
				containerPort: _commport.port
			},
			{
				name:          _txport.name
				containerPort: _txport.port
			},
		]
	}

}
