class Parcel < ApplicationRecord
  belongs_to :field
  has_many :interventions
end
