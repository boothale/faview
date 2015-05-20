#!/bin/bash

function size() {
    du -s media/ | cut -f1
}
SIZE=`size`

# If we're using more than 10GB of disk space
while (($SIZE > 10000000000)); do
	FILES=`find media/ -type f -printf '%T@ %p\n' | sort -nk1 | cut -d' ' -f2 | head -n100`
	rm $FILES
	SIZE=`size`
done
