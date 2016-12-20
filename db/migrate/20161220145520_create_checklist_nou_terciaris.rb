class CreateChecklistNouTerciaris < ActiveRecord::Migration
  def change
    create_table :checklist_nou_terciaris do |t|
      t.integer :edifici_id
      t.boolean :llicencies_preceptives
      t.boolean :certificat_final_obra
      t.boolean :acta_recepcio_obra
      t.boolean :escriptura_publica
      t.boolean :documents_garantia
      t.boolean :certificacio_energetica
      t.boolean :polissa_assegurances
      t.boolean :carregues_reals
      t.boolean :documents_complementaris
      t.boolean :documents_acreditatius_ajuts
      t.boolean :documents_justificacio_operacions
      t.boolean :declaracions_ce_ascensors

      t.timestamps null: false
    end
  end
end
