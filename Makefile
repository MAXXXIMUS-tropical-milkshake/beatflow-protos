# Your service name
SERVICE_NAME=auth

VALIDATOR_DIR=./vendor/protovalidate

# Install dependencies
install-deps:
	git clone https://github.com/bufbuild/protovalidate.git ${VALIDATOR_DIR}

# Proto generator for Go
gen-go:
	protoc \
		-I ${VALIDATOR_DIR}/proto/protovalidate \
		-I proto proto/${SERVICE_NAME}/*.proto --go_out=./gen/go/ \
		--go_opt=paths=source_relative --go-grpc_out=./gen/go/ \
		--go-grpc_opt=paths=source_relative

# remove vendor
clean:
	rm -rf vendor