FROM alpine:3.16.2

RUN apk add --no-cache ca-certificates git
RUN echo "while true; do git fetch; git reset --hard; sleep 10; done" | tee /usr/local/bin/update

ENTRYPOINT update
