#! /bin/bash

set -e

urlencode() {
    # urlencode <string>

    local LANG=C
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
}

RETURN_TO=$(urlencode $RETURN_TO)

envsubst '\$COOKIE_NAME \$CSRF_COOKIE_NAME \$AUTH0_TENANT \$AUTH0_CLIENT_ID' < ./nginx.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
