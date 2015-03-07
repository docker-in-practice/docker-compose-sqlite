#!/bin/bash
echo "Creating directory"
SQLITE=sqlite
if [[ $(which sqlite) ]]
then
	SQLITE=sqlite
elif [[ $(which sqlite2) ]]
then
	SQLITE=sqlite2
else
	echo "Please install sqlite (version 2)"
	exit 1
fi
SQLITE_VERSION=$(sqlite -version)
if [[ ${SQLITE_VERSION:0:1} != "2" ]]
then
	echo "Please install sqlite version 2, not version ${SQLITE_VERSION:0:1}.x"
	exit 1
fi
SQLITEDIR=/tmp/sqlitedbs
rm -rf $SQLITEDIR
if [ -a $SQLITEDIR ]
then
	echo "Failed to remove $SQLITEDIR"
	exit 1
fi
mkdir -p $SQLITEDIR
cd $SQLITEDIR
echo "Creating DBs"
echo 'create table t1(c1 text);' | $SQLITE test
echo 'create table t1(c1 text);' | $SQLITE live
echo "Inserting data"
echo 'insert into t1 values ("test");' | $SQLITE test
echo 'insert into t1 values ("live");' | $SQLITE live
cd - > /dev/null 2>&1 
echo "All done OK"
