FROM golang:1.18.1-alpine
EXPOSE 8000
WORKDIR /opt
COPY . /opt
RUN go mod tidy
RUN go build main.go
CMD ["main"]
