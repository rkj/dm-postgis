require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dm-postgis"
    gem.summary = %Q{Geometry type for DataMapper}
    gem.description = %Q{Adds DMGeometry type to DataMapper that uses GeoRuby for (de)serializing Geometry types into Postgis}
    gem.email = "roman.kamyk@gmail.com"
    gem.homepage = "http://github.com/rkj/dm-postgis"
    gem.authors = ["Roman Kamyk jr"]
    gem.add_dependency 'GeoRuby', '>= 1.3.4'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dm-postgis #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
