FROM alpine:20230208
COPY update.sh /usr/local/bin/update.sh
RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates wget tzdata git && \
    git config --global --add safe.directory /src && \
    chmod +x /usr/local/bin/update.sh

ENV GIT_DIR=/src/.git
WORKDIR /src
ENTRYPOINT ["update.sh"]
HEALTHCHECK CMD git fetch origin && git reset --hard origin || exit 1
