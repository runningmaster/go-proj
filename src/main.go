// Copyright 2014 runningmaster (@gmail.com). All rights reserved.

package main

import (
	"flag"
	"fmt"
	"runtime"

	"github.com/bradfitz/iter"
)

// make build sets this automaticaly
var (
	X_BLDTIME string
	X_GITHEAD string
	X_VERSION string
)

var (
	flagFoobar = flag.String("flag", "", "some flag")
)

func init() {
	runtime.GOMAXPROCS(runtime.NumCPU())
}

func main() {
	flag.Parse()
	fmt.Println("Hello, World!")
	fmt.Println(X_BLDTIME, X_GITHEAD, X_VERSION, *flagFoobar)
	for i := range iter.N(8) {
		fmt.Println(i)
	}
}
