# FROM golang:1.21

# WORKDIR /app

# COPY go.mod go.sum ./
# RUN go mod download

# COPY . .

# RUN go build -o server .

# EXPOSE 8080

# CMD ["./server"]


FROM golang:1.21 AS builder
WORKDIR /app
COPY ./go-app/go.mod ./go-app/go.sum ./
RUN go mod download
COPY ./go-app/ ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

FROM alpine:3.22
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD [ "./server" ]