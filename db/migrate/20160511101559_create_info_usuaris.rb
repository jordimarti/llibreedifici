class CreateInfoUsuaris < ActiveRecord::Migration
  def change
    create_table :info_usuaris do |t|
      t.integer :user_id
      t.integer :edifici_id
      t.string :nom
      t.string :nif
      t.string :poblacio
      t.string :provincia
      t.string :codi_postal
      t.string :adreca
      t.string :email
      t.string :numclient
      t.string :escolegiat
      t.string :nom_juridic
      t.string :cif
      t.string :pais
      t.string :tipus_client

      t.timestamps null: false
    end
  end
end
