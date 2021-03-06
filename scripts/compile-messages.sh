#!/bin/bash
set -e
cd "$(dirname $0)"/..
for L in $(find shared-data/locale -type d |grep "LC_MESSAGES"); do
    echo -e -n "$(echo $L |sed -e s,.*locale/,, -e s,/LC_.*,,)\t"
    msgfmt -c --statistics $L/mailpile.po -o $L/mailpile.mo || rm -f $L/mailpile.mo
done;
