class CreateChecklistExistentPlurifamiliars < ActiveRecord::Migration
  def change
    create_table :checklist_existent_plurifamiliars do |t|
      t.integer :edifici_id
      t.boolean :iite, :default => true
      t.boolean :document_lliurament_iite, :default => true
      t.boolean :comunicat_ens_local, :default => true
      t.boolean :programa_rehabilitacio, :default => true
      t.boolean :certificat_final_obra, :default => true
      t.boolean :certificat_aptitud, :default => true
      t.boolean :certificacio_energetica, :default => true
      t.boolean :instruccions_us, :default => true
      t.boolean :documents_justificatius_operacions, :default => true
      t.boolean :pressupostos_obres, :default => true
      t.boolean :certificats_instalacions_comunes, :default => true
      t.boolean :certificats_inspeccions_tecniques, :default => true

      t.timestamps null: false
    end
  end
end
