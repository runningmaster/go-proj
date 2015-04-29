package main

import (
	"flag"
	"fmt"

	"src/version"

	"github.com/golang/glog"
)

var n [int32(^uint32(0) >> 1)]struct{}

func main() {
	defer glog.Flush()

	flag.Parse()
	flag.Set("log_dir", ".") // Override glog's command line flag

	fmt.Println(rangeN(5), version.Print())

	// Example logging
	if glog.V(0) {
		glog.Info("info glog")
		glog.Warning("warning glog")
		glog.Error("error glog")
	}
}

func rangeN(N int) int {
	var i int
	for i = range n[:N] {
	}
	return i + 1
}
