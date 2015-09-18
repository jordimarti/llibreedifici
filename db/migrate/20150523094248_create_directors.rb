class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.integer :edifici_id
      t.string :nom_director
      t.string :titulacio_director
      t.string :rao_social_director
      t.string :nif_director
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
