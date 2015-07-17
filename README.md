# My template for my new go projects

## Сonventions:

1. Each project is a separate `$GOPATH`
2. List of external packages in `DEPENDENCIES`

## Getting Started:

1. `cp projvars.txt projvars.inc` and override some env vars in inc if necessary (usually `$GOROOT`, `$PROJNAME`)
2. `cd src` and execute `./build.bash` or `./buildrun.bash`

*If there is need for updating external dependencies - run `./upddeps.bash`*
