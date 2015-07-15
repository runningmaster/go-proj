#!/bin/bash -e

. build.bash

go_run() {
	cd $GOPATH/bin
	./$PROJ_NAME
}

printf "\n-- running --->\n"
go_run
printf "OK\n"
