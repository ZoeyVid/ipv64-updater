FROM alpine:20221110

RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates wget tzdata git && \
    echo "while true; do cd /src; git fetch origin; git reset --hard origin; sleep 30; done" | tee /usr/local/bin/update && \
    git config --global --add safe.directory /src && \
    chmod +x /usr/local/bin/update

ENTRYPOINT ["update"]
HEALTHCHECK CMD update
