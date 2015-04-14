package main

import (
	"flag"
	"fmt"

	"github.com/golang/glog"
	"github.com/runningmaster/version"
)

var n [int32(^uint32(0) >> 1)]struct{}

func main() {
	defer glog.Flush()

	flag.Parse()
	flag.Set("log_dir", ".") // Override glog's command line flag

	for i := range n[:5] {
		fmt.Println(i, version.Print())
	}

	// Example logging
	if glog.V(0) {
		glog.Info("info glog")
		glog.Warning("warning glog")
		glog.Error("error glog")
	}
}
