#!/bin/bash

set -e

IMPORT_FILE=${IMPORT_FILE:-export.ndjson}  

error_exit() { echo "$@" 1>&2; exit 1; }

ES_PASSWORD="${ES_PASSWORD:-$(vault read -field=es_password secret/kibana-issues/dev/apm-onweek-alerts-as-code)}"

if [ -z ${KIBANA_URL+x} ]; then
    error_exit "KIBANA_URL is not set"
fi

if [ -z ${KIBANA_SPACE+x} ]; then
    error_exit "KIBANA_SPACE is not set"
fi

OUTPUT=$(curl -s -X POST "$KIBANA_URL/s/$KIBANA_SPACE/api/saved_objects/_import?overwrite=true" \
    --user "$ES_USER:$ES_PASSWORD" \
    --header  "kbn-xsrf: true" \
    --form file="@$IMPORT_FILE")
ERROR=$(echo "$OUTPUT" | jq .error)

if [ "$ERROR" != "null" ]; then
    echo "$OUTPUT" | jq 1>&2; exit 1;
fi

echo "$OUTPUT" | jq
