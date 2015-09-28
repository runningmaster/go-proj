#!/bin/bash

. ../vars.inc

echo ""
rm -rf $GOPATH/pkg/
go install main
if [ $PROJNAME != 'main' ];
then
	rm -rf $GOPATH/bin/main
fi
echo ": gometalinter"
gometalinter ./main/...
