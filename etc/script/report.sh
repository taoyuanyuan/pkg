#!/usr/bin/env bash

set -e
echo "" > coverage.txt

for d in $(go list ./...); do
	echo "--------Run test package: $d"
	go test -v -coverprofile=profile.out -covermode=atomic $d
	echo "--------Finish test package: $d"
	if [ -f profile.out ]; then
		cat profile.out >> coverage.txt
		rm profile.out
	fi
done
