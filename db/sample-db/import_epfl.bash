#!/bin/bash

set -e

dbname=
dbuser=
pg_version=

data_dump="epfl_data.sql"
schema_dump="epfl_schema.sql"

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
if [[ -z ${pg_version} ]]; then
    if [[ -z ${PG_VERSION} ]]; then
        echo "Error: neither pg_version not PG_VERSION is defined"
        exit 1
    fi
    pg_version=${PG_VERSION}
fi

dirname=$(dirname $0)

psql -d ${dbname} < "/usr/share/postgresql/${pg_version}/contrib/dijkstra.sql"
psql -d ${dbname} < "/usr/share/postgresql/${pg_version}/contrib/dijkstra_postgis.sql"

if [[ ! -f "${dirname}/${data_dump}" ]]; then
    if [[ -f "${dirname}/${data_dump}.gz" ]]; then
        # data dump is gzip'ed
        cp ${dirname}/${data_dump}.gz /tmp
        gunzip /tmp/${data_dump}.gz

        cp ${dirname}/${schema_dump} /tmp
        dirname="/tmp"
    fi
fi

psql -d ${dbname} < ${dirname}/${schema_dump}
if [[ -f "${dirname}/${data_dump}" ]]; then
    psql -d ${dbname} < ${dirname}/${data_dump}
fi
psql -d ${dbname} -c "GRANT ALL ON camipro TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON epfl_routing_results_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON lines2 TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON lines2_gid_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON lines_attributes TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON more_lines_edges TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON more_lines_edges_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON more_lines_gid_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON more_lines_vertices TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON more_lines_vertices_id_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON nodes2 TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON nodes2_gid_seq TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON nodes_attributes TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON routing_results_seq TO \"${dbuser}\";"

exit 0
