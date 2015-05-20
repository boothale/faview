#!/bin/bash

mkdir -p media/ log/ tmp/ public/ static/
chown -R www-data:www-data media/ log/ tmp/

rm -rf wsgi/
DIRS=(avatar data themes thumbnail root)
for DIR in "${DIRS[@]}"; do
    mkdir -p wsgi/${DIR}/
    cd wsgi/${DIR}/
    mkdir -p public/
    ln -s ../../fa/ fa
    ln -s ../../log/ log
    ln -s ../../media/ media
    ln -s ../../website/wsgi_${DIR}.py passenger_wsgi.py
    ln -s ../../website/ website
    ln -s ../../tmp/ tmp
    cd -
done

echo "Generating secret key..."
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 64 > tmp/secret_key.txt

