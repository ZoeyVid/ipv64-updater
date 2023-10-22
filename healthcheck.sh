#!/bin/sh

if ! [ -f /tmp/IPv4.json ] && ! [ -f /tmp/IPv6.json ]; then 
  exit 1
fi

if [ -f /tmp/IPv4.json ] && [ "$(jq -r .status </tmp/IPv4.json)" != "success" ]; then 
  exit 1
fi

if [ -f /tmp/IPv6.json ] && [ "$(jq -r .status </tmp/IPv6.json)" != "success" ]; then 
  exit 1
fi

exit 0
