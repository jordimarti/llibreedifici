class CreateEntitatControls < ActiveRecord::Migration
  def change
    create_table :entitat_controls do |t|
      t.integer :edifici_id
      t.string :nom_entitat_control
      t.string :nif_entitat_control
      t.string :adreca_entitat_control
      t.integer :cp_entitat_control
      t.string :poblacio_entitat_control
      t.string :provincia_entitat_control
      t.string :pais_entitat_control

      t.timestamps null: false
    end
  end
end
