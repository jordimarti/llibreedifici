class CreateIndustrials < ActiveRecord::Migration
  def change
    create_table :industrials do |t|
      t.integer :edifici_id
      t.string :nom_industrial
      t.string :nif_industrial
      t.string :tipus_via_industrial
      t.string :via_industrial
      t.string :numero_industrial
      t.string :bloc_industrial
      t.string :escala_industrial
      t.string :pis_industrial
      t.integer :cp_industrial
      t.string :poblacio_industrial
      t.string :provincia_industrial
      t.string :pais_industrial

      t.timestamps null: false
    end
  end
end
