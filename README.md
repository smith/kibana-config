# Kibana config

Configuration for Kibana objects, with a script to deploy them through Kibana's APIs.

## deploy.sh

The deploy.sh script uploads the objects using Kibana's APIs.

Run `./deploy.sh` with these environment variables set:

* `ES_USER`
* `ES_PASSWORD`
* `KIBANA_SPACE`
* `KIBANA_URL`
* `IMPORT_FILE` (optional): The NDJSON file to be imported. Default is export.ndjson

Requires `curl`.

## export.sh

Using the same variables as above, use the export API to export objects:

`./export.sh > export.ndjson`

## prettify.sh

Expand an .ndjson file into a pretty-formatted JSON file:

`./prettify.sh export.ndjson > export.json`


## buildkite
