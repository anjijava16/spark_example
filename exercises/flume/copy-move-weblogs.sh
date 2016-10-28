#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: `basename $0` spooldirpath"
  exit $E_BADARGS
fi

echo "Copying and moving files"


TMPWEBLOGS=/tmp/tmp_weblogs

cp -rf /home/training/training_materials/data/weblogs $TMPWEBLOGS
mv $TMPWEBLOGS/* $1
rm -rf $TMPWEBLOGS
