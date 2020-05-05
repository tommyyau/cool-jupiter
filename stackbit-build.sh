#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb1d4c091c5b50019bd4228/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb1d4c091c5b50019bd4228
curl -s -X POST https://api.stackbit.com/project/5eb1d4c091c5b50019bd4228/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb1d4c091c5b50019bd4228/webhook/build/publish > /dev/null
