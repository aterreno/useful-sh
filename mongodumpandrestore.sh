#!/bin/sh

DUMP_DIR=/home/deploy

#remove old dump
if [ -d $DUMP_DIR ]; then
  echo "Deleting old live dump"
  rm -rf $DUMP_DIR
fi

#dump
mongodump --host some_mongo_db --port 27017 -o $DUMP_DIR

if [ -d $DUMP_DIR ]; then
  echo "Sucessfully dumped live db, now trying to restore"
  mongorestore --host some_other_mongo_db:27017 $DUMP_DIR
fi
