module practical-three/api-gateway

go 1.24.2

replace practical-three/proto/gen => ../proto/gen

require (
	github.com/gorilla/mux v1.8.1
	google.golang.org/grpc v1.75.0
	practical-three/proto/gen v0.0.0-00010101000000-000000000000
)

require (
	golang.org/x/net v0.41.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.26.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250707201910-8d1bb00bc6a7 // indirect
	google.golang.org/protobuf v1.36.6 // indirect
)
