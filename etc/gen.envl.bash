#!/usr/bin/env bash
. env.conf

if [ -f $CONFLOC ]; then
  confirm "Rewrite $(basename $CONFLOC) ?" || exit 0
fi

head -n 6 env.conf | tail -n 3 > $CONFLOC
