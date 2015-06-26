class CreateOperacions < ActiveRecord::Migration
  def change
    create_table :operacions do |t|
      t.text :descripcio
      t.decimal :periodicitat
      t.string :document_referencia
      t.string :responsable
      t.boolean :obligatorietat
      t.boolean :creat_usuari

      t.timestamps null: false
    end
  end
end
