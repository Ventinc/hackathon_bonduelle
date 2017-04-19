class Field < ApplicationRecord
  has_one :owner
  has_many :parcels
  has_many :weathers
end
