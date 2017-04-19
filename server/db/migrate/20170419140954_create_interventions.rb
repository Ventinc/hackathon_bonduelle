class CreateInterventions < ActiveRecord::Migration[5.0]
  def change
    create_table :interventions do |t|
      t.string :name
      t.text :description
      t.timestamps
      t.belongs_to :parcel, index: true, foreign_key: true
    end
  end
end
