# Top level makefile

MODULE=github.com/runningmaster/go-proj
COMMAND=${MODULE}/cmd/example
OUTBIN=$(shell sh -c 'pwd')/bin

GITTAG=$(shell sh -c 'git describe --tags --abbrev=0 || echo v0.0.1')
GITSHA=$(shell sh -c 'git rev-parse --short HEAD || echo 000000')
PRERELEASE=alpha
BUILD=$(shell date -u +%Y%m%d%H%M%S).${GITSHA}
SEMVER=${GITTAG}-${PRERELEASE}+${BUILD}


.PHONY: build
## build: Build the application
build: clean
	@echo "Building... ${SEMVER}"
	@go mod vendor \
		&& export GOBIN=${OUTBIN} \
		&& export GOFLAGS="-mod=vendor -ldflags=-s -ldflags=-w -ldflags=-X=main.semver=${SEMVER}" \
		&& go install ${COMMAND}


.PHONY: run
## run: Runs go run
run:
	@go run -race ${COMMAND}


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
	@echo "Init Go module"
	@go mod init ${MODULE} \
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
