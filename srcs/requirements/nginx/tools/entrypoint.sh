#!/bin/sh

SSL_DIR="/etc/nginx/ssl"
CRT="$SSL_DIR/azinchen.42.fr.crt"
KEY="$SSL_DIR/azinchen.42.fr.key"

mkdir -p "$SSL_DIR" #creates folder if doesn't exist

# generate certificate if doesn't exist
if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
    echo "SSL certificates not found. Generating new ones..."
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout "$KEY" \
        -out "$CRT" \
        -subj "/CN=azinchen.42.fr"
else
    echo "SSL certificates found. Using existing ones."
fi

# launches nginx
exec nginx -g "daemon off;"
