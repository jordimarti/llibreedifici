class CreateSubministradors < ActiveRecord::Migration
  def change
    create_table :subministradors do |t|
      t.integer :edifici_id
      t.string :nom_subministrador
      t.string :nif_subministrador
      t.string :adreca_subministrador
      t.string :cp_subministrador
      t.string :poblacio_subministrador
      t.string :provincia_subministrador
      t.string :pais_subministrador

      t.timestamps null: false
    end
  end
end
