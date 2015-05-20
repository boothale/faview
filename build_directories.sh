#!/bin/bash

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
    cd -
done
