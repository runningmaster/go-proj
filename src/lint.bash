#!/bin/bash

. ../vars.inc

echo ""

# >> workaround for linting with GO15VENDOREXPERIMENT=1
# check for go1.6
rm -rf $GOPATH/pkg/
go install main
if [ $PROJNAME != 'main' ];
then
	rm -rf $GOPATH/bin/main
fi
for f in $GOPATH/pkg/linux_amd64/vendor/*; do
	ln -s $f $GOPATH/pkg/linux_amd64/
done
# << workaround

echo ": gometalinter main"
gometalinter ./main/...

echo ": gometalinter internal"
gometalinter ./internal/...
