package main

import (
	"fmt"

	"github.com/bradfitz/iter"

	"internal/version"
)

func main() {
	for i := range iter.N(10) {
		fmt.Println(version.AppName(), i)
	}
}
