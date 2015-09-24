#!/bin/bash

. ../vars.inc

echo ""
echo ": gometalinter main"
gometalinter ./main/...

echo ": gometalinter main"
gometalinter ./internal/...

