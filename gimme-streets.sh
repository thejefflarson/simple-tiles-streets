#! /bin/bash

mkdir data

WD=`pwd`
tiger_em () {
  directory=$WD/$1
  shift
  until [ -z "$1" ]
  do
    get_em $directory "ftp://ftp2.census.gov/geo/tiger/TIGER2010/"$1
    shift
  done
  unzip_em $directory
}

get_em () {
  echo "Getting" $1 $2
  wget -r -nH -c -nd -P $1 $2
}

unzip_em () {
  cd $1
  unzip -o "*.zip"
  cd $WD
}

tiger_em 'data' 'ROADS/*.zip'
