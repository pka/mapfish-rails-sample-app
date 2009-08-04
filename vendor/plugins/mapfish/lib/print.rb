# 
# Copyright (C) 2007-2008  Camptocamp
#  
# This file is part of MapFish Server
#  
# MapFish Server is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#  
# MapFish Server is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#  
# You should have received a copy of the GNU Lesser General Public License
# along with MapFish Server.  If not, see <http://www.gnu.org/licenses/>.
#

require 'open4'

module MapFish
    module Print
        class JavaError < Exception
            def initialize(cmd, message)
                super(cmd+"\n"+message)
            end
        end

        # Used to add the needed routes for the print module
        def self.add_routes(map, controller = 'print', base = 'print')
            map.connect(base+'/info.:format', :controller=>controller, :action=>'info', :method=>:get)
            map.connect(base+'/create.:format', :controller=>controller, :action=>'create', :method=>:post)
            map.connect(base+'/:id.:format', :controller=>controller, :action=>'show', :method=>:get)
        end

        # To have a controller for the print module, just mix-in this module to
        # one of your controllers. This controller must have two attributes
        # defined: @classPath and @configFile. 
        # For example:
        # class PrintController < ApplicationController
        #     include MapFish::Print::Controller
        #
        #     def initialize()
        #         @classPath = "/home/toto/rails/Test/vendor/java/print/print-standalone/target/print-standalone.jar"
        #         @configFile = "/home/toto/rails/Test/vendor/java/print/print-standalone/samples/config.yaml"
        #     end
        # end 
        module Controller
            TEMP_PREFIX = Dir::tmpdir+"/mfPrintTempFile"
            TEMP_SUFFIX = ".pdf"
            TEMP_PURGE_SECONDS = 600

            def info
                cmd = baseCmd() + " --clientConfig"
                result = ""
                errors = ""
                status = Open4.popen4(cmd) do |pid, stdin, stdout, stderr|
                    result = stdout.readlines().join("\n")
                    errors = stderr.readlines().join("\n")
                end
                if status != 0
                    raise JavaError.new(cmd, errors)
                else
                    info = ActiveSupport::JSON.decode(result)
                    info['createURL']=url_for(:action=>'create')+'.json'
                    respond_to do |format|
                        format.json do
                            if params[:var]
                                render :text=>"var "+params[:var]+"="+result+";"
                            else
                                render :json=>info
                            end
                        end
                    end
                end
            end

            def create
                cleanupTempFiles
                
                tempId = rand(2**31) #TODO: not secure enough
                temp = TEMP_PREFIX + tempId.to_s + TEMP_SUFFIX
                cmd = baseCmd() + " --output=" + temp
                result = ""
                errors = ""
                status = Open4.popen4(cmd) do |pid, stdin, stdout, stderr|
                    body = request.body
                    FileUtils.copy_stream(body, stdin)
                    body.close()
                    stdin.close()
                    result = stdout.readlines().join("\n")
                    errors = stderr.readlines().join("\n")
                end
                if status != 0
                    raise JavaError.new(cmd, errors)
                else
                    respond_to do |format|
                        format.json do
                            render :json=>{ 'getURL' => url_for(:action=>'show', :id=>tempId)+".pdf" }
                        end
                    end
                end
            end

            def show
                temp = TEMP_PREFIX + params[:id] + TEMP_SUFFIX
                respond_to do |format|
                    format.pdf do
                        send_file temp, :type=>'application/x-pdf', :disposition=>'attachment', :filename=>params[:id]+'.pdf'
                    end
                end
            end

        protected

            def baseCmd
                return "java -cp " + @classPath + " org.mapfish.print.ShellMapPrinter --config='" + @configFile + "'"
            end

            def cleanupTempFiles
                minTime = Time.now - TEMP_PURGE_SECONDS;
                Dir.glob(TEMP_PREFIX + "*" + TEMP_SUFFIX).each do |path|
                    if File.mtime(path) < minTime
                        File.delete(path)
                    end
                end
            end
        end
    end
end
