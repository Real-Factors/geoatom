#! /bin/bash

FOLDER=$1

# -v `$FOLDER:/home/rf`
ANALYSIS_CONT=`docker run -p 8888:8888 --rm -it realfactors/unique-id /sbin/my_init --enable-insecure-key -- bash -i`
echo $ANALYSIS_CONT

# DB_CONT=`docker run --name uniqueid-postgres -e POSTGRES_PASSWORD=password -d postgres`
# echo $DB_CONT