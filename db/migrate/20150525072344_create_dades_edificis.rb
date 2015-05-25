class CreateDadesEdificis < ActiveRecord::Migration
  def change
    create_table :dades_edificis do |t|
      t.integer :edifici_id
      t.string :tipus_via_edifici
      t.string :via_edifici
      t.string :numero_edifici
      t.string :bloc_edifici
      t.string :escala_edifici
      t.integer :cp_edifici
      t.string :poblacio_edifici
      t.string :provincia_edifici
      t.string :ref_cadastral
      t.string :us_edifici
      t.integer :any_inici_construccio
      t.integer :any_fi_construccio

      t.timestamps null: false
    end
  end
end
