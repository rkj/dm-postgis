require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'
require 'dm-migrations'

ENV['ADAPTER']='postgres'
DataMapper::Spec.setup

describe "dm-postgis" do
  it "should load" do
    require 'dm-postgis'
  end

  describe "should allow DMGeometry property" do
    require 'dm-postgis'
    require 'fixtures/geo'
    it 'should work for empty values' do
      TestTable.new.should_not be_nil
    end

    it 'should work for positions' do
      g = GeoRuby::SimpleFeatures::Point.from_x_y(1, 2)
      t = TestTable.new(:position => g)
      t.save.should be(true)
      t.reload
      t.position.x.should == 1
      t.position.y.should == 2
    end
  end
end

