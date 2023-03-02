BINARY_NAME=assessment
LINTFLAGS=

binary:
	echo ${BINARY_NAME}

build:
	go build -o bin/${BINARY_NAME} main.go

run:
	go run main.go

runbuild: build
	./bin/${BINARY_NAME}

compile:
	echo "Compiling for every OS and Platform"
	GOOS=freebsd GOARCH=386 go build -o bin/${BINARY_NAME}-freebsd-386 main.go
	GOOS=linux GOARCH=386 go build -o bin/${BINARY_NAME}-linux-386 main.go
	GOOS=windows GOARCH=386 go build -o bin/${BINARY_NAME}-windows-386 main.go

clean:
	rm -rf bin/*

lint:
	golangci-lint run $(LINTFLAGS)

deps:
	go mod download