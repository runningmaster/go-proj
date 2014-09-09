// Copyright 2014 runningmaster (@gmail.com). All rights reserved.

package main

import (
	"flag"
	"fmt"
	"os"
	"os/signal"
	"runtime"
	"time" // for toml config example

	"github.com/BurntSushi/toml"
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

	// TOML config
	var tomlBlob = `
# Some comments.
[alpha]
ip = "10.0.0.1"

	[alpha.config]
	Ports = [ 8001, 8002 ]
	Location = "Toronto"
	Created = 1987-07-05T05:45:00Z

[beta]
ip = "10.0.0.2"

	[beta.config]
	Ports = [ 9001, 9002 ]
	Location = "New Jersey"
	Created = 1887-01-05T05:55:00Z
`

	type serverConfig struct {
		Ports    []int
		Location string
		Created  time.Time
	}

	type server struct {
		IP     string       `toml:"ip"`
		Config serverConfig `toml:"config"`
	}

	type servers map[string]server

	var config servers
	if _, err := toml.Decode(tomlBlob, &config); err != nil {
		glog.Fatal(err)
	}

	for _, name := range []string{"alpha", "beta"} {
		s := config[name]
		fmt.Printf("Server: %s (ip: %s) in %s created on %s\n",
			name, s.IP, s.Config.Location,
			s.Config.Created.Format("2006-01-02"))
		fmt.Printf("Ports: %v\n", s.Config.Ports)
	}
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
