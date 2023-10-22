#!/bin/sh

if [ -z "$TZ" ] || ! echo "$TZ" | grep -q "^[A-Za-z/]\+$"; then
    echo "TZ is unset or invalid."
    sleep inf
fi

if [ -z "$DUK" ] || ! echo "$DUK" | grep -q "^[A-Za-z0-9]\+$"; then
    echo "DUK is unset or invalid, it can consist of upper letters A-Z, lower letters a-z and numbers 0-9."
    sleep inf
fi


if [ "$IPv4" = "false" ] || [ "$(curl -s4 ipv64.net; echo $?)" != "7" ]; then
    if ! echo "$IPv4" | grep -q "^true$\|^false$"; then
        echo "IPv4 needs to be true or false."
        sleep inf
    fi
else
  if [ "$IPv4" != "false" ]; then
    if ! echo "$IPv4" | grep -q "^true$\|^false$"; then
      echo "IPv4 needs to be true or false."
      sleep inf
    fi
    echo "IPv4 does not work, disabling it."
    export IPv4="false"
  fi
fi


if [ "$IPv6" = "false" ] || [ "$(curl -s6 ipv64.net; echo $?)" != "7" ]; then
    if ! echo "$IPv6" | grep -q "^true$\|^false$"; then
        echo "IPv6 needs to be true or false."
        sleep inf
    fi
else
  if [ "$IPv6" != "false" ]; then
    if ! echo "$IPv6" | grep -q "^true$\|^false$"; then
      echo "IPv6 needs to be true or false."
      sleep inf
    fi
    echo "IPv6 does not work, disabling it."
    export IPv6="false"
  fi
fi


if ! echo "$UI" | grep -q "^[0-9]\+[smhd]\?$"; then
    echo "UI needs to be a number which can be followed by one of the chars s, m, h or d."
    sleep inf
fi

if [ "$IPv4" = "false" ] && [ "$IPv6" = "false" ]; then
    echo "IPv4 and IPv6 disabled, stopping."
    sleep inf
fi

while true; do
    if [ "$IPv4" = "true" ]; then
        curl -sLS4 https://ipv64.net/update.php?key="$DUK"
    fi
    if [ "$IPv6" = "true" ]; then
        curl -sLS6 https://ipv64.net/update.php?key="$DUK"
    fi
    
    sleep "$UI"
done
