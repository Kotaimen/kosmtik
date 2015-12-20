#!/usr/bin/env bash

set -e

# Carto 0.15.3 only supports 3.0.7 syntax
MAPNIK_VERSION=${MAPNIK_VERSION:-3.0.7}

# By default, use boundled test map
PROJECT_FILE=${1:-/usr/src/app/test/data/world/project.yml}

./index.js serve --mapnik-version=${MAPNIK_VERSION} --host=0.0.0.0 --port=6789 ${PROJECT_FILE}

