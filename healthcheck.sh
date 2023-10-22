#!/bin/sh

if ! [ -f /tmp/IPv4.json ] && ! [ -f /tmp/IPv6.json ]; then 
  exit 1
fi

if [ -f /tmp/IPv4.json ] && [ "$(cat /tmp/IPv4.json | jq -r .status)" != "success" ]; then 
  exit 1
fi

if [ -f /tmp/IPv6.json ] && [ "$(cat /tmp/IPv6.json | jq -r .status)" != "success" ]; then 
  exit 1
fi

exit 0
