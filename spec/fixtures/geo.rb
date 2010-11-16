class TestTable
  include ::DataMapper::Resource
  property :id, Serial
  property :position, DMGeometry, :required => false
end
DataMapper.auto_migrate!

