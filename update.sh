#!/bin/sh

if [ -z "$TZ" ] || ! echo "$TZ" | grep -q "^[A-Za-z/]\+$"; then
    echo "TZ is unset or invalid."
    sleep inf
fi

if ! echo "$IPv4" | grep -q "^true$\|^false$"; then
    echo "IPv4 needs to be true or false."
    sleep inf
fi

if ! echo "$IPv6" | grep -q "^true$\|^false$"; then
    echo "IPv6 needs to be true or false."
    sleep inf
fi

if ! echo "$UI" | grep -q "^[0-9]\+[smhd]\?$"; then
    echo "UI needs to be a number which can be followed by one of the chars s, m, h or d."
    sleep inf
fi

if [ "$IPv4" = "false" ] && [ "$IPv6" = "false" ]; then
    echo "You've disabled IPv4 and IPv6, which does not work."
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
