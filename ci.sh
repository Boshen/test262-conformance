#!/bin/bash

echo 'node:' `node --version`

./node_modules/.bin/test262-harness \
  --host-type=node \
  --host-path=`which node` \
	--timeout=10000 \
	--threads=8 \
  --preprocessor ./preprocessor.js \
  "./test262/test/language/asi/*.js" | grep -v ^PASS
