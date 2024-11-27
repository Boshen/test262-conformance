#!/bin/bash

./node_modules/.bin/test262-harness \
  --host-type=node \
  --host-path=`which node` \
  --reporter=json \
	--reporter-keys=file,result,scenario,attrs \
	--timeout=10000 \
	--threads=8 \
  "test262/test/language/comments/*.js" > "./results.json"
