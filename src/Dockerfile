FROM alpine:3.3

ARG VERSION

RUN apk add --no-cache multipath-tools=${VERSION}
COPY . /

ENTRYPOINT ["/sbin/multipathd", "-d"]
CMD ["-v", "3"]
