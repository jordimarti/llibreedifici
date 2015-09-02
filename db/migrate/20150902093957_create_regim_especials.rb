class CreateRegimEspecials < ActiveRecord::Migration
  def change
    create_table :regim_especials do |t|
      t.integer :edifici_id
      t.string :tipus_regim_especial
      t.string :referencia_document

      t.timestamps null: false
    end
  end
end
