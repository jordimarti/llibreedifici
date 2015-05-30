class CreateChecklistEdificiNouPlurifamiliars < ActiveRecord::Migration
  def change
    create_table :checklist_edifici_nou_plurifamiliars do |t|
      t.belongs_to :edifici, index: true
      t.boolean :dades, default: false
      t.boolean :planol_emplacament, default: false
      t.boolean :foto_facana, default: false
      t.boolean :promotor, default: false
      t.boolean :projectista, default: false
      t.boolean :constructor, default: false
      t.boolean :director, default: false
      t.boolean :director_execucio, default: false
      t.boolean :laboratori, default: false
      t.boolean :entitat_control, default: false
      t.boolean :subministrador, default: false
      t.boolean :industrial, default: false
      t.boolean :llicencia, default: false
      t.boolean :declaracio_obra_nova, default: false
      t.boolean :regim_propietat, default: false
      t.boolean :carregues, default: false
      t.boolean :entitats_juridiques, default: false
      t.boolean :acta_lliurament, default: false
      t.boolean :canvis_titularitat, default: false
      t.boolean :reformes, default: false
      t.boolean :canvis_dades_inicials, default: false
      t.boolean :ajuts, default: false
      t.boolean :assegurances, default: false
      t.boolean :enunciats_incidencies, default: false
      t.boolean :registre_operacions_manteniment, default: false
      t.boolean :registre_operacions_reparacio, default: false
      t.boolean :registre_operacions_millora, default: false
      t.boolean :registre_actuacions_arquitectoniques, default: false
      t.boolean :planols, default: false
      t.boolean :esquemes_instalacions, default: false
      t.boolean :descripcio_pes, default: false
      t.boolean :instruccions_us_manteniment, default: false
      t.boolean :documents_substitucio, default: false
      t.boolean :recomanacions_emergencies, default: false
      t.boolean :planols_habitatge, default: false
      t.boolean :planols_elements_privatius, default: false
      t.boolean :instruccions_us_manteniment_habitatge, default: false
      t.boolean :garanties_manuals_equips, default: false
      t.boolean :llicencies_preceptives, default: false
      t.boolean :certificat_final_obra, default: false
      t.boolean :acta_recepcio_obra, default: false
      t.boolean :escriptura_publica, default: false
      t.boolean :documents_garantia, default: false
      t.boolean :documents_garantia_parts_comunes, default: false
      t.boolean :certificacio_energetica, default: false
      t.boolean :polissa_assegurances, default: false
      t.boolean :escriptura_propietat_horitzontal, default: false
      t.boolean :estatus_comunitat, default: false
      t.boolean :cedules_regims_juridics, default: false
      t.boolean :carregues_reals, default: false
      t.boolean :documents_complementaris, default: false
      t.boolean :documents_acreditatius_ajuts, default: false
      t.boolean :documents_justificacio_operacions, default: false
      t.boolean :certificat_final_obra_instalacions, default: false
      t.boolean :declaracions_ce_ascensors, default: false

      t.timestamps null: false
    end
  end
end
