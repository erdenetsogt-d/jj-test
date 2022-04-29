FROM golang:alpine as builder
WORKDIR /app
COPY . /app
RUN go mod tidy
RUN go build main.go
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" .

#RUN make build
FROM scratch
WORKDIR /app
COPY --from=builder /app/main /usr/bin/
ENTRYPOINT ["main"]
EXPOSE 8000
