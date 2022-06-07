
.PHONY: build clean test format sanity

build: format
	export GO111MODULE=on
	env GOOS=linux go build -ldflags="-s -w" -o bin/pretty_table pretty_table.go

clean:
	rm -rf ./bin ./vendor Gopkg.lock

fresh: clean build

test:
	go test -p=1 -count=1 ./...

format:
	go fmt ./...

sanity: clean build test format
