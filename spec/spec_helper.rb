require 'bundler/setup'
require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'
require 'dm-migrations'
require 'dm-postgis-types'

ENV['ADAPTER']='postgres'

DataMapper::Spec.setup

repository.adapter.execute("CREATE EXTENSION IF NOT EXISTS postgis")


class Foo
  include DataMapper::Resource
  
  property :id, Serial
  property :x, Integer
  property :geom, PostGISGeometry
  property :y, Integer
end

DataMapper.auto_migrate!
