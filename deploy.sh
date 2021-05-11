#!/bin/bash

set -ex
echo "Deploying Kibana objects…"

IMPORT_FILE=${IMPORT_FILE:-export.ndjson}  

error_exit() { echo "$@" 1>&2; exit 1; }

if [ -z ${KIBANA_URL+x} ]; then
    error_exit "KIBANA_URL is not set"
fi

if [ -z ${KIBANA_SPACE+x} ]; then
    error_exit "KIBANA_SPACE is not set"
fi

curl -s -X POST "$KIBANA_URL/s/$KIBANA_SPACE/api/saved_objects/_import?overwrite=true" \
    --user "$ES_USER:$ES_PASS" \
    --header  "kbn-xsrf: true" \
    --form file="@$IMPORT_FILE" | jq
