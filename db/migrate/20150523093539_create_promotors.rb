class CreatePromotors < ActiveRecord::Migration
  def change
    create_table :promotors do |t|
      t.integer :edifici_id
      t.string :nom_promotor
      t.string :nif_promotor
      t.string :adreca_promotor
      t.string :cp_promotor
      t.string :poblacio_promotor
      t.string :provincia_promotor
      t.string :pais_promotor

      t.timestamps null: false
    end
  end
end
