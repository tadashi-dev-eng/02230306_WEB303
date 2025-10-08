# services/products-service/Dockerfile
FROM golang:1.24.2-alpine AS builder
WORKDIR /app

# Create the directory structure to match the replace directive
# The replace directive points to ../../proto/gen from services/products-service
# So we need to create the structure: /app/services/products-service/ and /app/proto/gen
COPY services/products-service/go.mod services/products-service/go.sum ./services/products-service/
COPY proto/gen ./proto/gen

# Change to the service directory for building
WORKDIR /app/services/products-service
RUN go mod download

# Copy the source code
COPY services/products-service/ .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/server ./main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 50052
CMD ["/app/server"]