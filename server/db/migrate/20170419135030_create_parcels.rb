class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
      t.belongs_to :field, index: true, foreign_key: true
    end
  end
end
