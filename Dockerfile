FROM golang:1.24-alpine AS builder

WORKDIR /build

COPY go.mod ./

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o daily-quote-app .

FROM alpine:3.14

WORKDIR /app

COPY --from=builder /build/daily-quote-app .
COPY --from=builder /build/template ./template

RUN apk --no-cache add ca-certificates

EXPOSE 8080

ENTRYPOINT ["/app/daily-quote-app"]
