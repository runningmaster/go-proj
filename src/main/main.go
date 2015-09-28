package main

import (
	"flag"
	"fmt"

	"main/internal/version"

	"github.com/bradfitz/iter"
	"github.com/golang/glog"
)

// N is alternative for bradfitz/iter
var N [int32(^uint32(0) >> 1)]struct{}

func main() {
	defer glog.Flush()
	flag.Parse()
	flag.Set("log_dir", ".") // Override glog's command line flag

	fmt.Println(version.Print())
	fmt.Println(len(N))
	fmt.Println(rangeN(5), rangeN2(5))

	// Example logging
	if glog.V(0) {
		glog.Info("info glog")
		glog.Warning("warning glog")
		glog.Error("error glog")

	}
}

func rangeN(n int) int {
	var i int
	for i = range N[:n] {
	}
	return i + 1
}

func rangeN2(n int) int {
	var i int
	for i = range iter.N(n) {
	}
	return i + 1
}
