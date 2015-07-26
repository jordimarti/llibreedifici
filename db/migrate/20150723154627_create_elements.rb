class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :edifici_id
      t.string :nom_element
      t.string :sistema_element

      t.timestamps null: false
    end
  end
end
