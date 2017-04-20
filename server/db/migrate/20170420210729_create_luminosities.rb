class CreateLuminosities < ActiveRecord::Migration[5.0]
  def change
    create_table :luminosities do |t|
      t.float :value
      t.float :longitude
      t.float :latitude
      t.timestamp :date
      t.belongs_to :parcel, index: true, foreign_key: true
    end
  end
end
