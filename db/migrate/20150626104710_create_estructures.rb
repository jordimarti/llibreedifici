class CreateEstructures < ActiveRecord::Migration
  def change
    create_table :estructures do |t|
      t.integer :edifici_id
      t.boolean :parets_pedra
      t.boolean :parets_formigo_armat
      t.boolean :parets_tova
      t.boolean :parets_tapia
      t.boolean :parets_fabrica_mao
      t.boolean :parets_bloc_ceramic
      t.boolean :parets_bloc_formigo
      t.boolean :parets_entramat_fusta
      t.boolean :pilars_mao
      t.boolean :pilars_ferro_colat
      t.boolean :pilars_acer
      t.boolean :pilars_formigo_armat
      t.boolean :bigues_fusta
      t.boolean :bigues_metaliques
      t.boolean :bigues_formigo_armat
      t.boolean :forjat_fusta
      t.boolean :forjat_metalic
      t.boolean :forjat_formigo_armat
      t.boolean :forjat_ceramica_armada
      t.boolean :entrebigat_taulell
      t.boolean :entrebigat_revolto_ceramic
      t.boolean :entrebigat_revolto_formigo
      t.boolean :forjat_reticular
      t.boolean :llosa_formigo
      t.boolean :forjat_sanitari
      t.boolean :solera
      t.boolean :forjat_horitzontal_coberta_capa_pendent
      t.boolean :forjat_horitzontal_coberta_envanets
      t.boolean :forjat_inclinat_coberta_formigo
      t.boolean :encavallada_bigues_formigo
      t.boolean :encavallada_bigues_metall
      t.boolean :encavallada_bigues_fusta
      t.boolean :coberta_taulell_ceramic
      t.boolean :coberta_taulell_fusta
      t.boolean :coberta_sandwich
      t.boolean :escala_fusta
      t.boolean :escala_metall
      t.boolean :escala_ceramica
      t.boolean :escala_llosa_armada

      t.timestamps null: false
    end
  end
end
