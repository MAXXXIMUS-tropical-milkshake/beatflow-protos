# Your service name
SERVICE_NAME=auth

# Install dependencies
install-deps:
	git clone https://github.com/bufbuild/protovalidate.git vendor/protovalidate

# Proto generator for Go
gen-go:
	protoc \
		-I ./vendor/protovalidate/proto/protovalidate \
		-I proto proto/${SERVICE_NAME}/*.proto --go_out=./gen/go/ \
		--go_opt=paths=source_relative --go-grpc_out=./gen/go/ \
		--go-grpc_opt=paths=source_relative

# remove vendor
clean:
	rm -rf vendor