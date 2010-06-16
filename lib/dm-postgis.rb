require 'geo_ruby'

module DataMapper
  class Property
    class DMGeometry < Property
      include GeoRuby::SimpleFeatures
      primitive ::Object
      default nil
      # length nil
      lazy false
    
      def dump(value)
        value.nil? ? nil : value.as_hex_ewkb
      end

      def load(value)
        value.nil? ? nil : Geometry.from_hex_ewkb(value)
      end
    
      def self.typecast(value, property)
        return value if value.nil? || value.kind_of?(Geometry)
        return Geometry.from_hex_ewkb(value)
      end
    end # class Text
  end # module Types
end # module DataMapper
