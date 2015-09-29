class CreateCobertes < ActiveRecord::Migration
  def change
    create_table :cobertes do |t|
      t.integer :edifici_id
      t.boolean :terrat_transitable
      t.boolean :terrat_no_transitable
      t.boolean :terrat_tradicional
      t.boolean :terrat_invertida
      t.boolean :terrat_lamina_bituminosa_oxiasfalt
      t.boolean :terrat_lamina_bituminosa_betum
      t.boolean :terrat_lamina_pvc_resistent
      t.boolean :terrat_lamina_pvc_no_resistent
      t.boolean :terrat_lamina_epdm
      t.boolean :terrat_lamina_cautxu
      t.boolean :terrat_lamina_polietile
      t.boolean :terrat_lamina_plaques_bituminoses
      t.boolean :terrat_lamina_cautxu_sintetic
      t.boolean :terrat_lamina_pastes_bituminoses
      t.boolean :terrat_junta_dilatacio_cautxu_butil
      t.boolean :terrat_junta_dilatacio_cautxu_sintetic
      t.boolean :terrat_junta_dilatacio_emulsions_bituminoses
      t.boolean :terrat_junta_dilatacio_silicona
      t.boolean :terrat_acabat_enrajolat
      t.boolean :terrat_acabat_lloses_flotants
      t.boolean :terrat_acabat_graveta
      t.boolean :terrat_acabat_lamina_autoprotegida
      t.boolean :coberta_teula_arab
      t.boolean :coberta_teula_plana
      t.boolean :coberta_teula_ciment
      t.boolean :coberta_pissarra
      t.boolean :coberta_fibrociment
      t.boolean :coberta_asfaltica
      t.boolean :coberta_xapa_acer
      t.boolean :coberta_xapa_coure
      t.boolean :coberta_aillament_termic
      t.boolean :lluernes_fixes
      t.boolean :lluernes_practicables
      t.boolean :lluernes_entramat_formigo
      t.boolean :lluernes_perfils_alumini
      t.boolean :lluernes_entramat_acer
      t.boolean :lluernes_emmotllats_vidre
      t.boolean :lluernes_vidre_armat
      t.boolean :lluernes_vidre_laminat
      t.boolean :lluernes_poliester
      t.boolean :lluernes_policarbonat
      t.boolean :aillament_cambra_ventilada
      t.boolean :aillament_material_adossat
      t.boolean :aillament_formigo_alleugerit_aire
      t.boolean :aillament_formigo_alleugerit_arids
      t.boolean :aillament_lamines
      t.boolean :aillament_amorf
      t.boolean :aillament_mantes
      t.boolean :aillament_plaques
      t.boolean :aillament_poliestire_expandit
      t.boolean :aillament_poliestire_estrudit
      t.boolean :aillament_polietile_expandit
      t.boolean :aillament_polietile_reticulat
      t.boolean :aillament_fibra_vidre
      t.boolean :aillament_llana_roca
      t.boolean :aillament_fibres_textils
      t.boolean :aillament_fibres_celulosa
      t.boolean :aillament_escuma_poliureta
      t.boolean :aillament_escuma_fenolica
      t.boolean :aillament_escuma_resina_melamina
      t.boolean :aillament_argila_expandida
      t.boolean :aillament_perlita_expandida
      t.decimal :aillament_gruix

      t.timestamps null: false
    end
  end
end
