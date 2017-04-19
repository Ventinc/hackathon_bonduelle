class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :description
      t.float :temperature
      t.float :humidity
      t.float :pressure
      t.float :wind_speed
      t.float :wind_dir
      t.timestamps
      t.belongs_to :field, index: true, foreign_key: true
    end
  end
end
