require 'do_postgres'

module DataObjects
  module Postgis 
    include Postgres
  end
end

require 'dm-migrations/adapters/dm-postgres-adapter'
module DataMapper
  module Migrations
    module PostgisAdapter 
      include DataMapper::Migrations::PostgresAdapter
      def self.included(base)
        base.extend DataObjectsAdapter::ClassMethods
        base.extend ClassMethods
      end
      
      module ClassMethods
        def type_map
          @type_map ||= super.merge(
            DataMapper::Property::DMGeometry => { :primitive => 'GEOMETRY' }
          ).freeze
        end # type_map
      end # module ClassMethods
    end # class PostgresAdapter
  end # module Migration
end # module
