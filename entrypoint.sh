#!/bin/sh -l

cd $GITHUB_WORKSPACE

GOFMT_OUTPUT="$(gofmt -l "$1" | grep -v vendor 2>&1)"

if [ -n "$GOFMT_OUTPUT" ]; then
  echo "All the following files are not correctly formatted"
  echo "${GOFMT_OUTPUT}"

  exit 1
fi

echo "::set-output name=gofmt-output::Gofmt step succeed"
