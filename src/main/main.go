package main

import (
	"flag"
	"fmt"

	"main/internal/version"

	"github.com/golang/glog"
)

var N [int32(^uint32(0) >> 1)]struct{}

func main() {
	defer glog.Flush()
	flag.Parse()
	flag.Set("log_dir", ".") // Override glog's command line flag

	fmt.Println(rangeN(5), version.Print())

	// Example logging
	//if glog.V(0) {
	//	glog.Info("info glog")
	//	glog.Warning("warning glog")
	//	glog.Error("error glog")
	//
	//}
}

func rangeN(n int) int {
	var i int
	for i = range N[:n] {
	}
	return i + 1
}
