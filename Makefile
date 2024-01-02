.PHONY: test
## test: runs all tests
test:
	@echo "Running tests..."
	@go test -v -race ./...

.PHONY: build
## build: builds the binary
build:
	@echo "Building binary..."

.PHONY: run
## run: runs the binary
run:
	@echo "Running binary..."

.PHONY: lint
## lint: runs the linter
lint:
	@echo "Running linter..."
	go mod verify
	# TODO: add linter

.PHONY: generate
## generate: runs the code generator
generate:
	@echo "Running code generator..."
	go generate ./...

.PHONY: help
## help: prints this help message
help:
	@echo "Usage:\n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':'
