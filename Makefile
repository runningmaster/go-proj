# Top level makefile

MOD=github.com/runningmaster/go-proj
CMD=${MOD}/cmd/example
BIN=$(shell pwd)/bin
#VER=$(shell git describe --tags --abbrev=0)-alpha+$(shell date -u +%Y%m%d%H%M%S).$(shell git rev-parse --short HEAD)


.PHONY: build
## build: Build the application
build: clean
	@echo "Building..."
	@go mod vendor \
		&& export GOBIN=${BIN} \
		&& export GOFLAGS="-mod=vendor -ldflags=-s -ldflags=-w -ldflags=-X=main.semver=${VER}" \
		&& go install ${CMD}


.PHONY: run
## run: Runs go run
run:
	@go run -race ${CMD}


.PHONY: lint
## lint: Runs linting go code
lint:
	@echo "Linting..."
	@golangci-lint run --enable-all \
		&& golangci-lint --version


.PHONY: test
## test: Runs go test with default values
test:
	@echo "Testing..."
	@go list ./... | grep -v vendor/ | xargs -L1 go test -race -cover -v -count=1 


.PHONY: bench
## bench: Runs go test with benchmarks
bench:
	@echo "Benchmarking..."
	@go list ./... | grep -v vendor/ | xargs -L1 go test -race -bench . -benchmem


.PHONY: init
## init: Init go module
init:
	@echo "Init Go module ${MOD}"
	@go mod init ${MOD} \
		&& go mod tidy \
		&& go mod vendor


.PHONY: list
## list: List dependicies for updating go module
list:
	@echo "Listing for update dependencies"
	@go list -u -m all


.PHONY: update
## update: Update dependicies for go module
update:
	@echo "Updating dependencies"
	@go get -u ./... \
		&& go mod tidy \
		&& go mod vendor


.PHONY: clean
## clean: Cleans the binary
clean:
	@echo "Cleaning..."
	@go mod tidy \
		&& go list ./... | grep -v vendor/ | xargs -L1 go generate \
		&& go list ./... | grep -v vendor/ | xargs -L1 go clean \
		&& go list ./... | grep -v vendor/ | xargs -L1 go fmt


.PHONY: help
## help: Prints this help message
help:
	@echo "Usage:"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
