package main

import (
	"flag"
	"fmt"

	"github.com/bradfitz/iter"
	"github.com/golang/glog"
	"github.com/runningmaster/ini403d/version"
)

func main() {
	flag.Parse()
	flag.Set("log_dir", ".") // Override glog's command line flag

	for i := range iter.N(10) {
		fmt.Println(i, version.Print())
	}

	// Example logging
	if glog.V(0) {
		glog.Info("info glog")
		glog.Warning("warning glog")
		glog.Error("error glog")
	}
	glog.Flush()
}
