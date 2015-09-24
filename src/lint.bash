#!/bin/bash

. ../vars.inc
	# workaround
        rm -rf $GOPATH/pkg
        go install main
        for f in $GOPATH/pkg/linux_amd64/vendor/*; do
                ln -s $f $GOPATH/pkg/linux_amd64/
        done


echo ""
echo ": gometalinter main"
gometalinter ./main/...

echo ": gometalinter internal"
gometalinter ./internal/...

# workaround
rm -rf $GOPATH/pkg
