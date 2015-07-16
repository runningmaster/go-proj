# My template for my new go projects

## Сonventions:

* Each project is a separate $GOPATH

## Getting Started:

1. Copy `cp projvars.txt projvars.inc` and override some env vars if necessary, usually it is $GOROOT
2. Run `cd src` and execute `./build.bash` or `./buildrun.bash`

*If there is need for updating external dependencies (see *DEPENDENCIES*) - run `./upddeps.bash`*
