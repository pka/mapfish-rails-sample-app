#!/bin/bash

set -e

dbname=
dbuser=

schema_dump="c2corg_schema.sql"
data_dump="c2corg_data.sql"

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
psql -d ${dbname} < ${dirname}/${data_dump}
psql -d ${dbname} -c "GRANT ALL ON parkings TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON parkings_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON parkings_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON parkings_parking_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON refuges TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON refuges_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON refuges_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON refuges_refuge_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sites TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sites_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sites_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sites_site_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sommets TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sommets_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sommets_out TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON sommets_sommet_id_seq TO \"${dbuser}\";"

exit 0
