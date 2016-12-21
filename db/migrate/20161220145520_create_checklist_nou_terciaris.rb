class CreateChecklistNouTerciaris < ActiveRecord::Migration
  def change
    create_table :checklist_nou_terciaris do |t|
      t.integer :edifici_id
      t.boolean :llicencies_preceptives, :default => true
      t.boolean :certificat_final_obra, :default => true
      t.boolean :acta_recepcio_obra, :default => true
      t.boolean :escriptura_publica, :default => true
      t.boolean :documents_garantia, :default => true
      t.boolean :certificacio_energetica, :default => true
      t.boolean :polissa_assegurances, :default => true
      t.boolean :carregues_reals, :default => true
      t.boolean :documents_complementaris, :default => true
      t.boolean :documents_acreditatius_ajuts, :default => true
      t.boolean :documents_justificacio_operacions, :default => true
      t.boolean :declaracions_ce_ascensors, :default => true

      t.timestamps null: false
    end
  end
end
