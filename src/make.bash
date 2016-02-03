#!/usr/bin/env bash
. ../etc/env.conf

go fmt main
go generate internal/version
go build -o $GOPATH/bin/$PROJNAME main
