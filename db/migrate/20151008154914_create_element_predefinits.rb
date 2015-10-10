class CreateElementPredefinits < ActiveRecord::Migration
  def change
    create_table :element_predefinits do |t|
      t.string :nom_element
      t.string :sistema_element
      t.text :descripcio_ca
      t.text :descripcio_es

      t.timestamps null: false
    end
  end
end
