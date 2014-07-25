#!/bin/sh
# Crappy deterministic zip repackager
export LC_ALL=C

ZIPFILE=`basename $1`

mkdir tmp_dzip
cd tmp_dzip
unzip ../$1
find . -executable -exec chmod 700 {} \;
find . ! -executable -exec chmod 600 {} \;
find . | sort | zip $ZIPOPTS -X -@ $ZIPFILE
mv $ZIPFILE ../$1
cd ..
rm -rf tmp_dzip
