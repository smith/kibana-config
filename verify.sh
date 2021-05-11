#!/bin/sh

set -e

# Simple script to verify if JSON is valid

for f in *.*json; do
    jq -s < "$f" > /dev/null
done
