require 'geo_ruby'

module DataMapper
  module Types
    class DMGeometry < DataMapper::Type
      include GeoRuby::SimpleFeatures
      
      primitive Text
      default nil
      lazy false
    
      def self.dump(value, property)
        value.nil? ? nil : value.as_hex_ewkb
      end

      def self.load(value, property)
        value.nil? ? nil : Geometry.from_hex_ewkb(value)
      end
    
      def self.typecast(value, property)
        return value if value.nil? || value.kind_of?(Geometry)
        return Geometry.from_hex_ewkb(value)
      end
    end # class Text
  end # module Types
  
  class Property
    PRIMITIVES << DataMapper::Types::DMGeometry
    def typecast_to_geometry(raw_value)
      return nil if raw_value.nil? || raw_value.empty?
      return GeoRuby::SimpleFeatures::Geometry.from_hex_ewkb(raw_value)
    end
  end
end # module DataMapper
