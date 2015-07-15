#!/bin/bash -e

. ../projvars.inc

run_editor() {
	$PROJ_EDIT
}

run_editor &
