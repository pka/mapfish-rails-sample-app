#!/bin/bash

set -e

export DBNAME="trunk_mapfishsample"
export DBUSER="www-data"
export PG_VERSION="8.1"


#
# Unless you know what you're doing do not modify anything
# beyond this comment.
#

dbname=${DBNAME}
dbuser=${DBUSER}
pg_version=${PG_VERSION}
dirname=$(dirname $0)
sub_scripts="import_c2corg.bash import_geostat.bash import_epfl.bash import_editing.bash"

usage() {
    echo "Usage: $0 [-p|--populate]"
    exit 1
}

exec_script() {
    script=$1
    echo $script
    if [[ -x ${script} ]]; then
        ${script}
    fi
}

# check options
while getopts "dp" opt; do
    case $opt in
    d) drop=1 ;;
    p) populate=1 ;;
    esac
done

if [[ -n ${drop} ]]; then
    dropdb ${dbname}
fi

createdb -E unicode ${dbname}
createlang plpgsql ${dbname}

psql -d ${dbname} < "/usr/share/postgresql-${pg_version}-postgis/lwpostgis.sql"
psql -d ${dbname} < "/usr/share/postgresql-${pg_version}-postgis/spatial_ref_sys.sql"

psql -c "GRANT ALL ON DATABASE \"${dbname}\" TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON TABLE geometry_columns TO \"${dbuser}\";"
psql -d ${dbname} -c "GRANT ALL ON TABLE spatial_ref_sys TO \"${dbuser}\";"

if [[ -n ${populate} ]]; then
    for script in ${sub_scripts}; do
        exec_script "${dirname}/${script}"
    done
fi

exit 0
