#!/bin/bash

. ../projvars.inc

printf "\n-- test main --->\n"
go test -bench=. -cover ./main/*.go

printf "\n-- test internal packages --->\n"
go test -bench=. -cover ./main/internal/...

printf "\n-- lnt --->\n"
golint ./main/*.go
golint ./main/internal/...

printf "\n-- vet --->\n"
go vet ./main/*.go
go vet ./main/internal/...

printf "\n-- err --->\n"
errcheck ./main/*.go
errcheck ./main/internal/...
