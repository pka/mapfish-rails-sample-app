#!/bin/bash

set -e

dbname=
dbuser=

schema_dump="editing_schema.sql"

#
# Unless you know what you're doing do not modify anything
# beyond this comment.
#

if [[ -z ${dbname} ]]; then
    if [[ -z ${DBNAME} ]]; then
        echo "Error: neither dbname nor DBNAME is defined"
        exit 1
    fi
    dbname=${DBNAME}
fi
if [[ -z ${dbuser} ]]; then
    if [[ -z ${DBUSER} ]]; then
        echo "Error: neither dbuser not DBUSER is defined"
        exit 1
    fi
    dbuser=${DBUSER}
fi

dirname=$(dirname $0)

psql -d ${dbname} < ${dirname}/${schema_dump}
psql -d ${dbname} -c "GRANT ALL ON points TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON points_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON lines TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON lines_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON polygons TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON polygons_id_seq TO \"${dbuser}\";"

exit 0
