// Copyright 2014 runningmaster (@gmail.com). All rights reserved.

package main

import (
	"flag"
	"fmt"
	"os"
	"os/signal"
	"runtime"

	"github.com/bradfitz/iter"
	"github.com/davecgh/go-spew/spew"
	"github.com/golang/glog"
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

	// Override glog's command line flag
	flag.Set("log_dir", ".")

	// Example logging
	if glog.V(0) {
		glog.Info("info glog")
		glog.Warning("warning glog")
		glog.Error("error glog")
	}

	// Example how spew is working
	m := map[string]int{"one": 1}
	spew.Sdump(m)

	fmt.Println("Hello, World!", X_BLDTIME, X_GITHEAD, X_VERSION, *flagFoobar)
	for i := range iter.N(8) {
		fmt.Println(i)
	}
	fmt.Println("For exit enter Ctrl + C...")

	// Example of interception Ctrl + C
	c, d := make(chan os.Signal, 1), make(chan bool)
	signal.Notify(c, os.Interrupt, os.Kill)
	go func() {
		for _ = range c {
			glog.Info("Ctrl + C -> Exit()")
			glog.Flush()
			d <- true
		}
	}()
	<-d
}
