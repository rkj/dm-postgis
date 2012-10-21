require 'dm-core'
require 'dm-migrations'
require 'dm-postgres-adapter'



module DataMapper

  class Property
    autoload :PostGISGeometry,            'dm-postgis/pg_geometry'
  end

  module PostGIS
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def type_map
        super.merge(
                    DataMapper::Property::PostGISGeometry => { :primitive => 'GEOMETRY' }
                    ).freeze
      end # type_map
    end # module ClassMethods
  end # class PostGIS
end # module

DataMapper::Adapters::PostgresAdapter.send(:include,DataMapper::PostGIS)
