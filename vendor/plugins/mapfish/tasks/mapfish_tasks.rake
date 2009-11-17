namespace :mapfish do

include FileUtils

desc "Install MapFish client"
task :install_client do
  version='trunk' # 'branches/1.1'
  rm_rf("public/build")
  rm_rf("public/mfbase/")
  system("svn export http://www.mapfish.org/svn/mapfish/framework/client/#{version}/mfbase public/mfbase")
  system("svn export http://www.mapfish.org/svn/mapfish/framework/client/#{version}/build public/build")
end

desc "Build MapFish release script"
task :build_scripts do
  puts 'Building MapFish..'
  puts <<EOS
  If you get error: Could not find suitable distribution for Requirement.parse('JSTools'), install it manually
  source public/build/venv/bin/activate
  easy_install 'http://github.com/whitmo/jstools/tarball/master'
  and call rake mapfish:build_scripts again
EOS
  system("sh public/build/build.sh")
end

desc "Copy scripts to public/javascripts"
task :copy_scripts do
  system("cp -r public/mfbase/release/* public/javascripts")
  rm_rf("public/javascripts/ext")
  mkdir_p("public/javascripts/ext/adapter/ext")
  mkdir_p("public/javascripts/ext/resources")
  system("cp public/mfbase/ext/ext-all.js public/javascripts/ext")
  system("cp public/mfbase/ext/adapter/ext/ext-base.js public/javascripts/ext/adapter/ext")
  system("cp -r public/mfbase/ext/resources/* public/javascripts/ext/resources")
end

end
