FROM golang:1.19.0 AS builder

WORKDIR /app
COPY . .
RUN go build -o main

FROM scratch

COPY --from=builder /app/main .

CMD ["./main"]
