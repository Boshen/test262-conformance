#!/bin/bash

./node_modules/.bin/test262-harness \
  --host-type=node \
  --host-path=`which node` \
	--timeout=10000 \
	--threads=8 \
  --reporter=json \
  --reporter-keys=file,result,scenario,attrs \
  --preprocessor ./preprocessor.js \
  "./test262/test/**/*.js" > "./results.json"
