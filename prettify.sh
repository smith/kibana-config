#!/bin/bash

set -e
jq -r -s  < "$1"
