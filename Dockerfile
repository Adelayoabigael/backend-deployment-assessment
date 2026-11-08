# Stage 1: Build Phase
FROM golang:1.21-alpine AS builder
WORKDIR /app

# Optimise caching dependencies
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o muchtodo .

# Stage 2: Minimal Execution Layer
FROM alpine:3.18
RUN addgroup -S devops && adduser -S appuser -G devops
WORKDIR /home/appuser

COPY --from=builder /app/muchtodo .

RUN chown -R appuser:devops /home/appuser
USER appuser

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

CMD ["./muchtodo"]