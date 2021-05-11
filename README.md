# Kibana config

[![Build status](https://badge.buildkite.com/a72eeff8ee8fcaa51198a5b5dac3572f077ed674bab406e6c7.svg)](https://buildkite.com/elastic/apm-onweek-alerts-as-code)

Configuration for Kibana objects, with a script to deploy them through Kibana's APIs.

The scripts require `curl` and `jq`.

## Scripts

### deploy.sh

The deploy.sh script uploads the objects using Kibana's saved object import API.

Run `./deploy.sh` with these environment variables set:

* `ES_USER`
* `ES_PASSWORD`
* `KIBANA_SPACE`
* `KIBANA_URL`
* `IMPORT_FILE` (optional): The NDJSON file to be imported. Default is export.ndjson

### export.sh

Using the same variables as above, use the export API to export objects:

`./export.sh > export.ndjson`

### prettify.sh

Expand an .ndjson file into a pretty-formatted JSON file:

`./prettify.sh export.ndjson > export.json`

## Build pipeline

[.buildkite/pipeline.yml](.buildkite/pipeline.yml) contains build steps for the Buildkite pipeline.
