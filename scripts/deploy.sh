#!/bin/bash
set -ev

if [ "${TRAVIS}" = "true" ]; then
  homedir=$TRAVIS_BUILD_DIR
else
  homedir=`pwd`
fi

sed -e 's/PARSE_APP_NAME/'"${PARSE_APP_NAME}"'/g' \
    -e 's/PARSE_CLI_VERSION/'"${PARSE_CLI_VERSION}"'/g' \
    -e 's/PARSE_APPLICATION_ID/'"${PARSE_APPLICATION_ID}"'/g' \
    -e 's/PARSE_MASTER_KEY/'"${PARSE_MASTER_KEY}"'/g' ${homedir}/config/template.json > ${homedir}/config/global.json


parse deploy

