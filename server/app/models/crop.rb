class Crop < ApplicationRecord
  has_many :interventions
  belongs_to :field
end
