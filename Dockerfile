FROM golang:1.18.1-alpine as builder
WORKDIR /opt
COPY . /opt
RUN go mod tidy
RUN go build main.go
FROM scratch
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /opt/main .
ENTRYPOINT ["/whoami"]
EXPOSE 8000
