# dm-postgis

Very simple type for datamapper allowing storing GeoRuby Geometries types in Postgis. This uses GeoRuby to do all the hard work. here's an example

```ruby

class Foo
  include DataMapper::Resource
  
  property :id, Serial
  property :name, Integer
  property :geom, PostGISGeometry
end

# create a GeoRuby LineString
line = GeoRuby::SimpleFeatures::LineString.new(4236)
#add some points
[[12.12,13.14], [12.13,14.15], [12.15,16.17]].each{|x,y| line.points << GeoRuby::SimpleFeatures::Point.from_x_y(x,y)}
# stick it in the db!
f = Foo.create(:name => "random geometry", :geom => line)
```


## Copyright

Copyright (c) 2010 Roman Kamyk jr, 2012 svs. See LICENSE for details.
