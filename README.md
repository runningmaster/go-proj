# My template for my new go projects

## Сonventions:

1. Each project is a separate `$GOPATH`
2. List of external packages in `DEPENDENCIES`

## Getting Started:

1. `cp vars.txt vars.inc` and override some env vars (usually `$GOROOT`) in inc file
2. `cd src` and execute `./make.bash`

*If there is need for updating external dependencies - run `./sync.bash`*
