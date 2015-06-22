class CreateEntitatControls < ActiveRecord::Migration
  def change
    create_table :entitat_controls do |t|
      t.integer :edifici_id
      t.string :nom_entitat_control
      t.string :nif_entitat_control
      t.string :tipus_via_entitat_control
      t.string :via_entitat_control
      t.string :numero_entitat_control
      t.string :bloc_entitat_control
      t.string :escala_entitat_control
      t.string :pis_entitat_control
      t.string :cp_entitat_control
      t.string :poblacio_entitat_control
      t.string :provincia_entitat_control
      t.string :pais_entitat_control

      t.timestamps null: false
    end
  end
end
