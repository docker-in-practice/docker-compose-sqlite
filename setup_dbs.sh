#!/bin/bash
echo "Creating directory"
SQLITE=sqlite
if [[ $(which sqlite) ]]
then
	SQLITE=sqlite
elif [[ $(which sqlite2) ]]
then
	SQLITE=sqlite2
elif [[ $(which sqlite3) ]]
then
	SQLITE=sqlite3
else
	echo "Please install sqlite"
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
