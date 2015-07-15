#!/bin/bash -e

. ../projvars.inc

BLDTIME=`date -u +%d-%m-%Y.%H:%M:%S`
GITHEAD=`git rev-parse --short HEAD`
VERSION=1.0 #`git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'`

go_build() {
	go fmt main
	go build \
		-ldflags "\
			-X main/internal/version.BLDTIME=$BLDTIME \
			-X main/internal/version.GITHEAD=$GITHEAD \
			-X main/internal/version.VERSION=$VERSION" \
		-o $GOPATH/bin/$PROJ_NAME main
}

printf "\n-- build --->\n"
go_build
printf "OK\n"