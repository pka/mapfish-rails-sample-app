Install jstools
===============

Create a virtual Python environment:

$ wget 'http://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.3.2.tar.gz'
$ tar xvzf virtualenv-1.3.2.tar.gz
$ python virtualenv-1.3.2/virtualenv.py env
$ source env/bin/activate

"env" is the name of the virtual environment.

Install jstools in the virtual environment:

$ easy_install -i http://dev.camptocamp.com/packages/mapfish/all/index JSTools

--
To install the latest github version you can use:
$ easy_install 'http://github.com/whitmo/jstools/tarball/master'
--

Build
=====

You can now build MapFish, OpenLayers and GeoExt together with:

$ jsbuild -o ../../mfbase/release/mapfish/ full.cfg

This will create "MapFish.js" in "../../mfbase/release/mapfish".
