Mapfish sample application with the Ruby on Rails plugin
========================================================

This is a Ruby version of the `MapFish <http://www.mapfish.org/>`_ sample application with 
some tests of the Rails plugin.

The Mapfish server for Ruby is implemented as a plugin for the `Ruby on Rails <http://www.rubyonrails.org/>`_ framework.

Preparation
-----------

Setup the sample db with the scripts in db/sample-db/

Install the required gems::

  sudo gem install GeoRuby


Starting the web server
-----------------------

Start the web server::

  ./script/server

and checkout ``http://localhost:3000/demos/``



*Copyright (c) 2009 Pirmin Kalberer, Sourcepole AG*
