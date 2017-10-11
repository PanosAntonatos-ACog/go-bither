.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/bitherhq/go-bither/cmd/swarm
	go build -o bin/bith     github.com/bitherhq/go-bither/cmd/bith
	go build -o bin/bootnode github.com/bitherhq/go-bither/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/bitherhq/go-bither/swarm/...
