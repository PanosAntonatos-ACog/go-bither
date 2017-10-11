# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: bith android ios bith-cross swarm evm all test clean
.PHONY: bith-linux bith-linux-386 bith-linux-amd64 bith-linux-mips64 bith-linux-mips64le
.PHONY: bith-linux-arm bith-linux-arm-5 bith-linux-arm-6 bith-linux-arm-7 bith-linux-arm64
.PHONY: bith-darwin bith-darwin-386 bith-darwin-amd64
.PHONY: bith-windows bith-windows-386 bith-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

bith:
	build/env.sh go run build/ci.go install ./cmd/bith
	@echo "Done building."
	@echo "Run \"$(GOBIN)/bith\" to launch bith."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/bith.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Bith.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

bith-cross: bith-linux bith-darwin bith-windows bith-android bith-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/bith-*

bith-linux: bith-linux-386 bith-linux-amd64 bith-linux-arm bith-linux-mips64 bith-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-*

bith-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/bith
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep 386

bith-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/bith
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep amd64

bith-linux-arm: bith-linux-arm-5 bith-linux-arm-6 bith-linux-arm-7 bith-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep arm

bith-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/bith
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep arm-5

bith-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/bith
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep arm-6

bith-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/bith
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep arm-7

bith-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/bith
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep arm64

bith-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/bith
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep mips

bith-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/bith
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep mipsle

bith-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/bith
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep mips64

bith-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/bith
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/bith-linux-* | grep mips64le

bith-darwin: bith-darwin-386 bith-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/bith-darwin-*

bith-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/bith
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/bith-darwin-* | grep 386

bith-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/bith
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/bith-darwin-* | grep amd64

bith-windows: bith-windows-386 bith-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/bith-windows-*

bith-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/bith
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/bith-windows-* | grep 386

bith-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/bith
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/bith-windows-* | grep amd64
