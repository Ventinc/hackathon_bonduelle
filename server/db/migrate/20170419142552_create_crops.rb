class CreateCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.integer :quantity
      t.timestamp :harvest
      t.timestamps
      t.belongs_to :field, index: true, foreign_key: true
    end

    change_table :interventions do |t|
      t.belongs_to :crop, index: true, foreign_key: true
    end
  end
end
