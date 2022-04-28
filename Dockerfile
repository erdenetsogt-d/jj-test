FROM golang:1.18.1-alpine as builder
WORKDIR /opt
COPY . /opt
RUN go mod tidy
RUN go build main.go
FROM scratch
COPY --from=builder /opt/main .
ENTRYPOINT ["/main"]
EXPOSE 8000
