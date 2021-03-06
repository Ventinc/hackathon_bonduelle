class Parcel < ApplicationRecord
  belongs_to :field
  has_many :interventions
  has_many :humidities
  has_many :moistures
  has_many :temperatures
  has_many :luminosities

  def datas
    [moistures: moistures, luminosity: luminosities, temperatures: temperatures, humidities: humidities]
  end
end
