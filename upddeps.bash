#!/bin/bash -e

. projvars.inc

go_get_and_install() {
	while read pkg
	do
		[[ "$pkg" =~ ^#.*$ ]] && continue
		if [ "$pkg" != '' ];
		then
			echo "$pkg"
			rm -rf $GOPATH/src/$pkg			
			go get -d $pkg
			pushd $GOPATH/src/$pkg > /dev/null 2>&1
			for i in ".hg*" ".git*" ".bzr*" ".svn"
			do
				find . -name "$i" -print0 | xargs -0 rm -rf
			done
			popd > /dev/null 2>&1
		fi
	done < ./DEPENDENCIES
	go install main
	echo "OK (get/install)"
}

echo ""
confirm "Update external packages?" && go_get_and_install
