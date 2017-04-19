class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.belongs_to :field, index: true, foreign_key: true
    end
  end
end
