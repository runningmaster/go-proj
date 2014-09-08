// Copyright 2014 runningmaster (@gmail.com). All rights reserved.

package main

import (
	"flag"
	"fmt"
	"os"
	"os/signal"
	"runtime"

	itr "github.com/bradfitz/iter"
	log "github.com/golang/glog"
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
	flag.Set("log_dir", ".")

	if log.V(0) {
		log.Info("info glog")
		log.Warning("warning glog")
		log.Error("error glog")

		fmt.Println("Hello, World!", X_BLDTIME, X_GITHEAD, X_VERSION, *flagFoobar)
		for i := range itr.N(8) {
			fmt.Println(i)
		}
		fmt.Println("For exit enter Ctrl + C...")
	}

	// Ctrl + C
	c, d := make(chan os.Signal, 1), make(chan bool)
	signal.Notify(c, os.Interrupt, os.Kill)
	go func() {
		for _ = range c {
			log.Info("Ctrl + C -> Exit()")
			log.Flush()
			d <- true
		}
	}()
	<-d
}
