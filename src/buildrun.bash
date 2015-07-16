#!/bin/bash -e

. build.bash

go_run() {
	cd $GOPATH/bin
	./$PROJ_NAME
	echo "OK (run)"
}

echo ""
go_run
