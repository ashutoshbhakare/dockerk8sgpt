# Stage 1: Build k8sgpt
FROM golang:1.22 AS builder

WORKDIR /app

# Download k8sgpt
RUN go install github.com/k8sgpt-ai/k8sgpt/cmd/k8sgpt@latest

# Stage 2: Create the final image
FROM alpine/git:latest # Using alpine/git as it's lightweight and has git which k8sgpt might internally use for some operations, though not strictly necessary for basic usage.

# Install necessary packages for k8sgpt runtime (if any, although k8sgpt is a static Go binary)
# Adding ca-certificates for HTTPS communication.
RUN apk add --no-cache ca-certificates openssl

# Copy the k8sgpt binary from the builder stage
COPY --from=builder /go/bin/k8sgpt /usr/local/bin/k8sgpt

# Set the entrypoint to a shell so users can interact with the container
ENTRYPOINT ["/bin/sh"]

# Define an environment variable for the Gemini API key
# This will be set when running the container
ENV K8SGPT_AI_GEMINI_API_KEY=""

# Instructions for the user on how to use the container
# This is a comment, not an executed command
# To run:
# docker build -t k8sgpt-gemini .
# docker run -it --rm \
#   -e K8SGPT_AI_GEMINI_API_KEY="YOUR_GEMINI_API_KEY" \
#   -v /path/to/your/kubeconfig:/root/.kube/config:ro \
#   k8sgpt-gemini
#
# Inside the container, you can then run k8sgpt commands, e.g.:
# k8sgpt analyze
