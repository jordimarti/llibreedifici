class CreateDadesEdificiExistents < ActiveRecord::Migration
  def change
    create_table :dades_edifici_existents do |t|
      t.integer :edifici_id
      t.string :tipus_via_edifici
      t.string :via_edifici
      t.string :numero_edifici
      t.string :bloc_edifici
      t.string :escala_edifici
      t.string :cp_edifici
      t.string :poblacio_edifici
      t.string :provincia_edifici
      t.string :ref_cadastral
      t.string :us_edifici

      t.timestamps null: false
    end
  end
end
