FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/bitherhq/go-bither && \
  (cd go-bither && make bith) && \
  cp go-bither/build/bin/bith /bith && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-bither && rm -rf /var/cache/apk/*

EXPOSE 7070
EXPOSE 41207

ENTRYPOINT ["/bith"]
