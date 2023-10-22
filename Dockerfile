FROM alpine:3.18.4
COPY update.sh /usr/local/bin/update.sh
RUN apk add --no-cache ca-certificates tzdata tini curl

ENV IPv4=true \
    IPv6=true \
    UI=5m

ENTRYPOINT ["tini", "--", "update.sh"]
#HEALTHCHECK CMD (rm -rf /src/.git/index.lock && git fetch origin > /dev/null 2>&1 && git reset --hard origin > /dev/null 2>&1) || exit 1
