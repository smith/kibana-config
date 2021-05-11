#!/bin/bash

set -e

error_exit() { echo "$@" 1>&2; exit 1; }

if [ -z ${KIBANA_URL+x} ]; then
    error_exit "KIBANA_URL is not set"
fi

if [ -z ${KIBANA_SPACE+x} ]; then
    error_exit "KIBANA_SPACE is not set"
fi

curl -s -X POST "$KIBANA_URL/s/$KIBANA_SPACE/api/saved_objects/_export" \
    --user "$ES_USER:$ES_PASSWORD" \
    --header "Content-Type: application/json" \
    --header  "kbn-xsrf: true" \
    --data '{"type":["apm-indices","index-pattern","config","dashboard","alert","url","query","visualization","timelion-sheet","graph-workspace","search","tag","lens","canvas-element","canvas-workpad","map","action","infrastructure-ui-source","metrics-explorer-view","inventory-view"],"includeReferencesDeep":true,"excludeExportDetails":true}'
