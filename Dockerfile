FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" .

FROM scratch
WORKDIR /app
COPY --from=builder /app/main /usr/bin/

EXPOSE 8000
CMD ["main"]
