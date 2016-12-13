require 'data_mapper'
require 'dm-postgres-adapter'

class Space

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price_per_night, Integer, required: true

end
