FROM alpine:3.18.0
RUN apk add --no-cache ca-certificates tzdata git && \
    git config --global --add safe.directory /src

WORKDIR /src
ENV GIT_DIR=/src/.git
ENTRYPOINT while true; do (rm -rf /src/.git/index.lock && git fetch origin && git reset --hard origin && sleep 30) || exit 1; done || exit 1
HEALTHCHECK CMD (rm -rf /src/.git/index.lock && git fetch origin > /dev/null 2>&1 && git reset --hard origin > /dev/null 2>&1) || exit 1
