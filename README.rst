Mapfish sample application with the Ruby on Rails plugin
========================================================

This is a Ruby version of the `MapFish <http://www.mapfish.org/>`_ sample application with 
some tests of the Rails plugin.

The Mapfish server for Ruby is implemented as a plugin for the `Ruby on Rails <http://www.rubyonrails.org/>`_ framework.

Preparation
-----------

Setup the sample db with the scripts in db/sample-db/::

  export DBNAME=mapfishsample
  export DBUSER=mapfish
  psql -c "CREATE ROLE $DBUSER LOGIN PASSWORD 'mapfish'" postgres
  createdb --template template_postgis --owner $DBUSER -E unicode $DBNAME
  for i in import_c2corg.bash import_geostat.bash import_epfl.bash import_editing.bash; do
    bash $i
  done

Install the required gems::

  bundle install


Starting the web server
-----------------------

Start the web server::

  rails server

and checkout ``http://localhost:3000/demos/``



*Copyright (c) 2008-20010 Pirmin Kalberer, Sourcepole AG*
