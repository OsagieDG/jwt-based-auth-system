build-api:
	@go build -o bin/api ./cmd/api/

run: build-api
	@echo "Loading environment variables from .env..."
	@export $(shell cat .env | xargs) && ./bin/api

lint:
	@golangci-lint run ./...

cyclomatic:
	@goclyco -over 7 .

clean:
	@rm -rf bin

