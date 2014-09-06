#!/bin/bash


for i in "$@"; do
case $i in
    -p=*|--prefix=*)
    #PREFIX=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    PREFIX=${i#*=}

    ;;
    -s=*|--searchpath=*)
    #SEARCHPATH=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    SEARCHPATH=${i#*=}
    ;;
    -l=*|--lib=*)
    #DIR=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    DIR=${i#*=}
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
      # unknown option
      echo cli_option.sh -p=my_prefix -s=dirname -l=libname
    ;;
esac
done
echo PREFIX = ${PREFIX}
echo SEARCH PATH = ${SEARCHPATH}
echo DIRS = ${DIR}
