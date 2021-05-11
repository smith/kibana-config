#!/bin/bash

#set -ex

# IMPORT_FILE=${IMPORT_FILE:-export.ndjson} 

# CONTENTS="$(sed '$d' < "$IMPORT_FILE" | jq -r -s '.[]')"
# #FILENAMES="$(jq -r -s '.[] |  select(.id != null) | .type + "/" + .id + ".json"' < "$IMPORT_FILE")"
# FILENAMES="$(echo "$CONTENTS" | jq -r -s '.[] | .id + ".json"')"
# TYPES="$(echo "$CONTENTS" | jq -r -s '.[] | .type')"

# # for TYPE in $TYPES
# # do
# #     mkdir -p "$TYPE"
# # done

# #sed '$d' < "$IMPORT_FILE" | jq -r -s '.[]'
# #jq -r -s '.[] | select(.id != null) | .type' < "$IMPORT_FILE"

# #echo $TYPES
# for i in "${!CONTENTS[@]}"; do
#   TYPE="${TYPES[$i]}"
#   FILENAME="${FILENAMES[$i]}"
#  echo "$FILENAME"; echo "/$TYPE"
# #    echo "${CONTENTS[$i]}" > "$TYPE/$FILENAME"
# #  test "${TYPES[$i]}" != null && echo "${CONTENTS[$i]}" > "${OBJECTS[$i]}"
# done

jq -r -s  < "$1"
