# My template for my new go projects

## Сonventions:

1. Each project is a separate $GOPATH

## Getting Started:

1. `cp projvars.txt projvars.inc` and override in inc some env vars if necessary, usually it is $GOROOT and $PROJNAME
2. `cd src` and execute `./build.bash` or `./buildrun.bash`

*If there is need for updating external dependencies (see DEPENDENCIES) - run `./upddeps.bash`*
