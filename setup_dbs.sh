#!/bin/bash
echo "Creating directory"
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
echo 'create table t1(c1 text);' | sqlite test
echo 'create table t1(c1 text);' | sqlite live
echo "Inserting data"
echo 'insert into t1 values ("test");' | sqlite test
echo 'insert into t1 values ("live");' | sqlite live
cd - > /dev/null 2>&1 
echo "All done OK"
