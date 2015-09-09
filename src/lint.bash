#!/bin/bash

. ../vars.inc

echo ""
echo ": gometalinter"
gometalinter ./main/...
