#!/bin/bash

echo $1

./node_modules/.bin/test262-harness \
  --host-type=node \
  --host-path="$1" \
	--timeout=10000 \
	--threads="$(node -pe 'os.cpus().length - 1')" \
  --preprocessor ./preprocessor.js \
  --features-exclude="module" \
  --test262-dir=test262 \
  "test262/test/language/**/*.js" | grep -v ^PASS
