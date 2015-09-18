class CreateProjectistes < ActiveRecord::Migration
  def change
    create_table :projectistes do |t|
      t.integer :edifici_id
      t.string :nom_projectista
      t.string :titulacio_projectista
      t.string :rao_social_projectista
      t.string :nif_projectista
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
