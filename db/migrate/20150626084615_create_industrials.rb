class CreateIndustrials < ActiveRecord::Migration
  def change
    create_table :industrials do |t|
      t.integer :edifici_id
      t.string :nom_industrial
      t.string :nif_industrial
      t.string :adreca_industrial
      t.string :cp_industrial
      t.string :poblacio_industrial
      t.string :provincia_industrial
      t.string :pais_industrial
      t.string :servei_obra
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
