FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN apk add git

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app/ /app/

EXPOSE 8000
CMD ["/app/main"]
