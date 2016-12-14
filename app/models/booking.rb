require 'data_mapper'
require 'dm-postgres-adapter'

class Booking

  include DataMapper::Resource

  belongs_to :user
  belongs_to :space

  property :id,                 Serial
  property :booking_date,       Date, required: true
  property :booking_confirmed,  Boolean, default: false

end
