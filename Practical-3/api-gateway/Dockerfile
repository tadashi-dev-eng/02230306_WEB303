# api-gateway/Dockerfile
FROM golang:1.24.2-alpine AS builder
WORKDIR /app

# Create the directory structure to match the replace directive
# The replace directive points to ../proto/gen from api-gateway
# So we need to create the structure: /app/api-gateway/ and /app/proto/gen
COPY api-gateway/go.mod api-gateway/go.sum ./api-gateway/
COPY proto/gen ./proto/gen

# Change to the api-gateway directory for building
WORKDIR /app/api-gateway
RUN go mod download

# Copy the source code
COPY api-gateway/ .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/server ./main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["/app/server"]