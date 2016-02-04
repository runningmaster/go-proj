#!/usr/bin/env bash
. ../../etc/env.conf

GOPKGS=vendor.list
confirm "Update $GOPKGS packages?" || exit 0

GOPATH=$(pwd)

# cleanup
find $GOPATH -mindepth 1 -maxdepth 1 -type d | xargs rm -rf

# download
while read pkg
do
	[[ $pkg =~ ^#.*$ || $pkg = "" ]] && continue
	go get -d $pkg
	echo " ->" $pkg "- OK"
done < $GOPKGS

# move src
if [ -d "src" ]; then
	cp -rf src/* .  && rm -rf src
fi

# save git rev
find $GOPATH -type d -name ".git" -print0 | while IFS= read -r -d $'\0' line; do
	cd $(dirname "$line") && git rev-parse HEAD > .gitcommit
done

# kill .git dir
for i in ".git*" ".hg*" ".bzr*" ".svn*"
do
	find $GOPATH -type d -name "$i" -print0 | xargs -0 rm -rf
done
