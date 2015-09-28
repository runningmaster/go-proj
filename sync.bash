#!/bin/bash -e

. vars.inc

go_get_and_install() {
	rm -rf $GOPATH/pkg
	rm -rf $GOPATH/src/vendor
	while read pkg
	do
		[[ "$pkg" =~ ^#.*$ ]] && continue
		if [ "$pkg" != '' ];
		then
			echo "$pkg"
			go get -d $pkg
			pkgdir=$(echo "/$pkg" | cut -d "/" -f2)
			mkdir -p $GOPATH/src/vendor/$pkgdir 
			cp -rf $GOPATH/src/$pkgdir $GOPATH/src/vendor/
			rm -rf $GOPATH/src/$pkgdir
		fi
	done < ./DEPENDENCIES

	for i in ".hg*" ".git*" ".bzr*" ".svn"
	do
		find $GOPATH/src/vendor -name "$i" -print0 | xargs -0 rm -rf
	done

	echo "OK (get/install)"
}

echo ""
confirm "Update external packages?" && go_get_and_install
