class CreateInfoUsuaris < ActiveRecord::Migration
  def change
    create_table :info_usuaris do |t|
      t.integer :user_id
      t.integer :edifici_id
      t.string :nom
      t.string :cognoms
      t.string :adreca
      t.string :codi_postal
      t.string :poblacio
      t.string :provincia
      t.string :pais
      t.string :telefon_fix
      t.string :telefon_mobil
      t.string :fax
      t.string :num_premaat
      t.string :num_musaat
      t.string :sexe
      t.string :any_naixement
      t.string :nif
      t.string :web

      t.timestamps null: false
    end
  end
end
