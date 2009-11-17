/*
 * Copyright (C) 2009  Camptocamp
 *
 * This file is part of MapFish Client
 *
 * MapFish Client is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * MapFish Client is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MapFish Client.  If not, see <http://www.gnu.org/licenses/>.
 */

(function() {

    // The geostat and search examples use XMLHttpRequest to read features from
    // the server. If those XMLHttpRequest's target a different domain than
    // that serving the page, some proxy is needed. So do not set ProxyHost
    // (and comment this line) if the example pages are served by the same
    // domain than that responding to the XMLHttpRequest's. Otherwise set up a
    // proxy script (for example using the provided proxy.cgi script) and
    // adjust the OpenLayers.ProxyHost variable accordingly.
    OpenLayers.ProxyHost = "/cgi-bin/proxy.cgi?url=";

    // The editing-panel example also uses XMLHttpRequest to create, read,
    // update and delete features. Because proxy.cgi does not support other
    // HTTP verbs than GET and POST another proxy is needed for this example to
    // work correctly. Such a proxy is provided in the examples/ directory.
    mapfish.PROXY_HOST = '/proxy/http-proxy.py';

    // Define a constant with the base url to the MapFish web service. If you
    // want to rely on the MapFish services provided on demo.mapfish.org/trunk,
    // leave this variable untouched; otherwise modify it appropriately. You
    // may want to use ''.
    mapfish.SERVER_BASE_URL = 'http://demo.mapfish.org/mapfishsample/trunk/';
})();
