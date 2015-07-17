#!/bin/bash -e

. build.bash

go_run() {
	cd $GOPATH/bin
	./$PROJNAME
	echo "OK (run)"
}

echo ""
go_run
