class CreateCoordinadors < ActiveRecord::Migration
  def change
    create_table :coordinadors do |t|
      t.integer :edifici_id
      t.string :nom_coordinador
      t.string :titulacio_coordinador
      t.string :rao_social_coordinador
      t.string :nif_coordinador
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
