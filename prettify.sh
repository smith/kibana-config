#!/bin/bash

#set -ex

IMPORT_FILE=${IMPORT_FILE:-export.ndjson} 

CONTENTS="$(sed '$d' < "$IMPORT_FILE" | jq -r -s '.[]')"
#FILENAMES="$(jq -r -s '.[] |  select(.id != null) | .type + "/" + .id + ".json"' < "$IMPORT_FILE")"
TYPES="$(echo "$CONTENTS" | jq -r -s '.[] | .type')"

# for TYPE in $TYPES
# do
#     mkdir -p "$TYPE"
# done

#sed '$d' < "$IMPORT_FILE" | jq -r -s '.[]'
#jq -r -s '.[] | select(.id != null) | .type' < "$IMPORT_FILE"

for i in "${!CONTENTS[@]}"; do
  echo $TYPES[$i]
 # echo -n $FILENAMES[$i]
# echo $CONTENTS[$i] > $FILENAMES[$i]
#  test "${TYPES[$i]}" != null && echo "${CONTENTS[$i]}" > "${OBJECTS[$i]}"
done
