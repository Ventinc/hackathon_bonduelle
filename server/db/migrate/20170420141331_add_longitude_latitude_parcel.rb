class AddLongitudeLatitudeParcel < ActiveRecord::Migration[5.0]
  def change
    change_table :parcels do |t|
      t.float :longitude
      t.float :latitude
    end
  end
end
