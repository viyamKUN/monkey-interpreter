.PHONY: install-tools
## install-tools: installs all tools
install-tools:
	@echo "Installing tools..."
	@cat tools.go | grep _ | awk -F'"' '{print $$2}' | xargs -tI % go install %

.PHONY: test
## test: runs all tests
test:
	@echo "Running tests..."
	@gotest -v -race ./...

.PHONY: build
## build: builds the binary
build:
	@echo "Building binary..."
	go build -o bin/ ./...

.PHONY: run
## run: runs the binary
run:
	@echo "Running binary..."

.PHONY: lint
## lint: runs the linter
lint:
	@echo "Running linter..."
	go mod verify
	golangci-lint run

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
