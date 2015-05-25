class CreateConstructors < ActiveRecord::Migration
  def change
    create_table :constructors do |t|
      t.integer :edifici_id
      t.string :nom_constructor
      t.string :nif_constructor
      t.string :tipus_via_constructor
      t.string :via_constructor
      t.string :numero_constructor
      t.string :bloc_constructor
      t.string :escala_constructor
      t.string :pis_constructor
      t.integer :cp_constructor
      t.string :poblacio_constructor
      t.string :provincia_constructor
      t.string :pais_constructor

      t.timestamps null: false
    end
  end
end
