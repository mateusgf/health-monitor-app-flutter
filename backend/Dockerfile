# Use the official Golang image as a builder (includes Go tools)
FROM golang:1.23 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go modules and install dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# Use Alpine for the final image (debuggable, lightweight)
FROM alpine:latest

# Use distroless for the final container
# FROM gcr.io/distroless/base-debian12

# Install libc6-compat for Go binary compatibility
RUN apk add --no-cache libc6-compat

# Set the working directory in the final image
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/main .

# Expose the port your application runs on
EXPOSE 8081

# Command to run the application
CMD ["./main"]
