#!/usr/bin/env bash
. ../../etc/env.conf

GOPKGS=vendor.list
confirm "Update $GOPKGS packages?" || exit 0

GOPATH=$(pwd)
find $GOPATH -mindepth 1 -maxdepth 1 -type d | xargs rm -rf
while read pkg
do
	[[ $pkg =~ ^#.*$ || $pkg = "" ]] && continue
	go get -d $pkg
	echo " ->" $pkg "- OK"
done < $GOPKGS
if [ -d "src" ]; then
cp -rf src/* .  && rm -rf src
fi
for i in ".git*" ".hg*" ".bzr*" ".svn*"
do
	find $GOPATH -name "$i" -print0 | xargs -0 rm -rf
done
