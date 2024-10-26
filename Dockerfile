FROM golang:1.23-alpine3.20 AS builder

WORKDIR /app
COPY . .

RUN go mod download

RUN go build -o /app/flutter-webrtc-server ./cmd/server/main.go

FROM alpine:3.20
WORKDIR /app

COPY --from=builder /app/flutter-webrtc-server /app/flutter-webrtc-server

ENTRYPOINT ["/app/flutter-webrtc-server"]