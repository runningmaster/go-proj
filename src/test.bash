#!/bin/bash

. ../vars.inc

echo ""
echo ": go test main"
go test -bench=. -cover ./main/*.go

echo ""
echo ": go test internal"
go test -bench=. -cover ./main/internal/...
