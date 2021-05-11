# Kibana config

Configuration for Kibana objects, with a script to deploy them through Kibana's APIs.

The directories in this repository have saved JSON output from Kibana objects.

The deploy.sh script uploads the objects using Kibana's APIs.

## deploy.sh

Run `./deploy.sh` with these environment variables set:

* `ES_USER`
* `ES_PASS`
* `KIBANA_SPACE`
* `KIBANA_URL`
* `IMPORT_FILE` (optional): The NDJSON file to be imported. Default is export.ndjson

Requires `curl`.

# prettify.sh

Breaks apart a file from an export into multiple, pretty printed files in directories.

Can use these environment variables:

* `IMPORT_FILE` (optional): The NDJSON file to be imported. Default is export.ndjson


## buildkite
