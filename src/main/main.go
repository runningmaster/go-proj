package main

import (
	"fmt"

	"internal/version"

	"github.com/bradfitz/iter"
)

func main() {
	for i := range iter.N(10) {
		fmt.Println(version.Stamp.AppName(), i)
	}
}
