#!/bin/bash -e

. projvars.inc

go_get_and_install() {
	find $GOPATH/src -mindepth 1 -maxdepth 1 -type d ! -name 'main' | xargs rm -rf

	while read pkg
	do
		[[ "$pkg" =~ ^#.*$ ]] && continue
		if [ "$pkg" != '' ];
		then
			echo "$pkg"
			go get -d $pkg
		fi
	done < ./DEPENDENCIES

        for i in ".hg*" ".git*" ".bzr*" ".svn"
        do
		find $GOPATH/src -name "$i" -print0 | xargs -0 rm -rf
        done

	go install main
	echo "OK (get/install)"
}

echo ""
confirm "Update external packages?" && go_get_and_install
