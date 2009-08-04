#!/bin/sh
# 
# Copyright (C) 2007-2008  Camptocamp
#  
# This file is part of MapFish Client
#  
# MapFish Client is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#  
# MapFish Client is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#  
# You should have received a copy of the GNU General Public License
# along with MapFish Client.  If not, see <http://www.gnu.org/licenses/>.
#

set -e

#
# Command path definitions
#
python="/usr/bin/python"
mkdir="/bin/mkdir"
rm="/bin/rm"
sh="/bin/sh"
cp="/bin/cp"

#
# Variables
#
buildpath="$(cd $(dirname $0); pwd)"
releasepath="${buildpath}/../mfbase/release"
venv="${buildpath}/venv"

#
# Remove old release dir
#
${rm} -rf "${releasepath}"

#
# MapFish.js build
#
mapfishpath="${buildpath}/../mfbase/mapfish"
if [ -d ${releasepath} ]; then
    ${rm} -rf ${releasepath}
fi

cfgfile="full.cfg"
if [ -n "$1" -a -f "$1" ]; then
    cfgfile="$1"
fi


mapfishreleasepath="${releasepath}/mapfish"
${mkdir} -p ${mapfishreleasepath}
(cd ${buildpath};
 if [ ! -d ${venv} ]; then
     echo "creating virtual env and installing jstools..."
     ${python} go-jstools.py ${venv} > /dev/null
     echo "done."
 fi;
 echo "running jsbuild..."
 ${venv}/bin/jsbuild -o "${mapfishreleasepath}" full.cfg
 echo "done.")

# MapFish resources
${cp} -r "${mapfishpath}/img" "${mapfishreleasepath}"

# OpenLayers resources
openlayerspath="${buildpath}/../mfbase/openlayers"
openlayersreleasepath="${releasepath}/openlayers"

${mkdir} ${openlayersreleasepath}
${cp} -r "${openlayerspath}/img" "${openlayersreleasepath}"
${cp} -r "${openlayerspath}/theme" "${openlayersreleasepath}"

# Ext resources
extpath="${buildpath}/../mfbase/ext"
extreleasepath="${releasepath}/ext"

#${mkdir} ${extreleasepath}
#${cp} -r "${extpath}"/ext-all.js "${extpath}"/adapter "${extpath}"/air "${extpath}"/resources "${extreleasepath}"
#${cp} -r "${extpath}-community-extensions" "${extreleasepath}-community-extensions"

# Cleanup SVN stuff
${rm} -rf `find "${releasepath}" -name .svn -type d`

exit 0
