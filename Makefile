SERVICE_NAME=auth

# Proto generator for Go
gen-go:
	protoc \
		-I proto proto/${SERVICE_NAME}/*.proto --go_out=./gen/go/ \
		--go_opt=paths=source_relative --go-grpc_out=./gen/go/ \
		--go-grpc_opt=paths=source_relative