require 'spec_helper'

describe "dm-postgis" do
  let(:line)   { GeoRuby::SimpleFeatures::LineString.new(4236).tap {|l|
      [[12.12,13.14], [12.13,14.15], [12.15,16.17]].each{|x,y| l.points << GeoRuby::SimpleFeatures::Point.from_x_y(x,y)}
    }
  }
  describe "dump" do
    subject { Foo.properties[:geom].dump(line) }
    it { should == "01020000208C100000030000003D0AD7A3703D284048E17A14AE472A40C3F5285C8F422840CDCCCCCCCC4C2C40CDCCCCCCCC4C2840EC51B81E852B3040" }
  end
  describe "load" do
    subject { Foo.properties[:geom].load("01020000208C100000030000003D0AD7A3703D284048E17A14AE472A40C3F5285C8F422840CDCCCCCCCC4C2C40CDCCCCCCCC4C2840EC51B81E852B3040") }
    it { should == line }
  end

end

