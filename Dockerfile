# Build bith in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-bither
RUN cd /go-bither && make bith

# Pull bith into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-bither/build/bin/bith /usr/local/bin/

EXPOSE 7070 7071 41207 41207/udp
ENTRYPOINT ["bith"]
