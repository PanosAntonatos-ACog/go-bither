FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/bitherhq/go-bither && \
  (cd go-bither && make bith) && \
  cp go-bither/build/bin/bith /bith && \
  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-bither

EXPOSE 7070
EXPOSE 41207

ENTRYPOINT ["/bith"]
