require 'geo_ruby'
require 'dm-core'

module DataMapper
  class Property
    class DMGeometry < Object
      include GeoRuby::SimpleFeatures

      def primitive?(value)
        value.kind_of? Geometry
      end

      def dump(value)
        value.nil? ? nil : value.as_hex_ewkb
      end

      def valid?(value, negated = false)
        super || dump(value).kind_of?(::String)
      end

      def load(value)
        value.nil? ? nil : Geometry.from_hex_ewkb(value)
      end
    
      def typecast_to_primitive(value)
        load(value)
      end
    end # class Text
  end # module Types
end # module DataMapper
