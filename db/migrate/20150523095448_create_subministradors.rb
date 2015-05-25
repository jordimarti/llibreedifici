class CreateSubministradors < ActiveRecord::Migration
  def change
    create_table :subministradors do |t|
      t.integer :edifici_id
      t.string :nom_subministrador
      t.string :nif_subministrador
      t.string :tipus_via_subministrador
      t.string :via_subministrador
      t.string :numero_subministrador
      t.string :bloc_subministrador
      t.string :escala_subministrador
      t.string :pis_subministrador
      t.integer :cp_subministrador
      t.string :poblacio_subministrador
      t.string :provincia_subministrador
      t.string :pais_subministrador

      t.timestamps null: false
    end
  end
end
