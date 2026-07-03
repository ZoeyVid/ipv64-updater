# syntax=docker/dockerfile:1.25.0@sha256:0adf442eae370b6087e08edc7c50b552d80ddf261576f4ebd6421006b2461f12
FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
COPY update.sh /usr/local/bin/update.sh
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini curl jq bind-tools && \
    chmod -R 777 /tmp

ENV IPv4=true \
    IPv6=true \
    UI=5m

USER nobody
ENTRYPOINT ["tini", "--", "update.sh"]
HEALTHCHECK CMD healthcheck.sh || exit 1
