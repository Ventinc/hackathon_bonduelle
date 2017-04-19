class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.float :longitude
      t.float :latitude
    end
  end
end
