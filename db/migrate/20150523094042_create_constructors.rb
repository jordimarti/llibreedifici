class CreateConstructors < ActiveRecord::Migration
  def change
    create_table :constructors do |t|
      t.integer :edifici_id
      t.string :nom_constructor
      t.string :nif_constructor
      t.string :adreca_constructor
      t.string :cp_constructor
      t.string :poblacio_constructor
      t.string :provincia_constructor
      t.string :pais_constructor
      t.string :telefon
      t.string :email
      t.string :web

      t.timestamps null: false
    end
  end
end
