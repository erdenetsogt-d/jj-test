FROM golang:alpine as builder
WORKDIR /app
COPY . /app
RUN go mod tidy
RUN go build main.go
RUN CGO_ENABLED=0 
#RUN make build
FROM scratch
WORKDIR /app
COPY --from=builder /app/main /usr/bin/
ENTRYPOINT ["main"]
EXPOSE 8000
