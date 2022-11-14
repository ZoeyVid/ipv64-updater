FROM alpine:20221110

RUN apk upgrade --no-cache
RUN apk add --no-cache ca-certificates git
RUN echo "while true; do git fetch origin; git reset --hard origin; sleep 30; done" | tee /usr/local/bin/update
RUN chmod +x /usr/local/bin/update

WORKDIR /src
RUN git config --global --add safe.directory /src

ENTRYPOINT update
