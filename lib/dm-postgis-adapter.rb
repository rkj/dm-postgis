require 'postgis_adapter'
require 'dm-postgres-adapter'
module DataMapper
  module Adapters
    class PostgisAdapter < PostgresAdapter
      include DataMapper::Migrations::PostgisAdapter
    end
  end
end
