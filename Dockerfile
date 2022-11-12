FROM alpine:3.16.3

RUN apk add --no-cache ca-certificates git
RUN echo "while true; do git fetch origin; git reset --hard origin; sleep 30; done" | tee /usr/local/bin/update && chmod +x /usr/local/bin/update

WORKDIR /src
RUN git config --global --add safe.directory /src

ENTRYPOINT update
