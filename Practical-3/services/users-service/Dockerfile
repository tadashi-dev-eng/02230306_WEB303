# services/users-service/Dockerfile
FROM golang:1.24.2-alpine AS builder
WORKDIR /app

# Create the directory structure to match the replace directive
# The replace directive points to ../../proto/gen from services/users-service
# So we need to create the structure: /app/services/users-service/ and /app/proto/gen
COPY services/users-service/go.mod services/users-service/go.sum ./services/users-service/
COPY proto/gen ./proto/gen

# Change to the service directory for building
WORKDIR /app/services/users-service
RUN go mod download

# Copy the source code
COPY services/users-service/ .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/server ./main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 50051
CMD ["/app/server"]