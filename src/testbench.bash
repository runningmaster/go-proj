#!/bin/bash

. ../projvars.inc

MAIN=./main/*.go
INTERNAL=./main/internal/...

echo ""
echo ": go test main"
go test -bench=. -cover $MAIN

echo ""
echo ": go test internal"
go test -bench=. -cover $INTERNAL

echo ""
echo ": go vet"
go vet $MAIN && go vet $INTERNAL

echo ""
echo ": go lint"
golint $MAIN && golint $INTERNAL

echo ""
echo ": errcheck"
errcheck $MAIN && errcheck $INTERNAL
