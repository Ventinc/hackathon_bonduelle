class AddNameToField < ActiveRecord::Migration[5.0]
  def change
    change_table :fields do |t|
      t.string :name
    end
  end
end
