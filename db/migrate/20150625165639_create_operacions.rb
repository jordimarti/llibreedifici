class CreateOperacions < ActiveRecord::Migration
  def change
    create_table :operacions do |t|
      t.text :descripcio_ca
      t.text :descripcio_es
      t.decimal :periodicitat
      t.string :periodicitat_text_ca
      t.string :periodicitat_text_es
      t.string :document_referencia
      t.string :responsable_ca
      t.string :responsable_es
      t.boolean :obligatorietat
      t.boolean :creat_usuari
      t.string :sistema

      t.timestamps null: false
    end
  end
end
