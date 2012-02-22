#!/usr/bin/env bash

HASH="%C(yellow)%h%Creset"
RELATIVE_TIME="%Cgreen(%ar)%Creset"
AUTHOR="%C(bold blue)<%an>%Creset"
REFS="%C(red)%d%Creset"
SUBJECT="%s"

FORMAT="$HASH - $REFS $SUBJECT $RELATIVE_TIME $AUTHOR"

git log --graph --abbrev-commit --date=relative --pretty="tformat:${FORMAT}" $* |
    sed -Ee 's/(^[^<]*) ago\)/\1)/' |
    sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/'
