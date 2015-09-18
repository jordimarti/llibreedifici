class CreateColaboradors < ActiveRecord::Migration
  def change
    create_table :colaboradors do |t|
      t.integer :edifici_id
      t.string :nom_colaborador
      t.string :titulacio_colaborador
      t.string :rao_social_colaborador
      t.string :nif_colaborador
      t.string :ambit_colaboracio
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
