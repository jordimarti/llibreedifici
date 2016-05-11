class CreateIdentificacions < ActiveRecord::Migration
  def change
    create_table :identificacions do |t|
      t.integer :edifici_id
      t.string :tipus_via_edifici
      t.string :via_edifici
      t.string :numero_edifici
      t.string :bloc_edifici
      t.string :escala_edifici
      t.string :cp_edifici
      t.string :poblacio_edifici
      t.string :provincia_edifici
      t.integer :any_inici_construccio
      t.integer :any_fi_construccio
      t.string :origen_any_construccio
      t.text :observacions
      t.string :nom_empresa
      t.string :adreca_empresa

      t.timestamps null: false
    end
    add_attachment :identificacions, :planol_emplacament
    add_attachment :identificacions, :foto_facana
    add_attachment :identificacions, :logo_empresa
  end
end
