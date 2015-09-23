class CreateCobertes < ActiveRecord::Migration
  def change
    create_table :cobertes do |t|
      t.integer :edifici_id
      t.boolean :terrat_transitable
      t.boolean :terrat_no_transitable
      t.boolean :terrat_aillament_termic
      t.boolean :terrat_lamina_impermeabilitzant
      t.boolean :coberta_teula_arab
      t.boolean :coberta_teula_plana
      t.boolean :coberta_teula_ciment
      t.boolean :coberta_pissarra
      t.boolean :coberta_fibrociment
      t.boolean :coberta_asfaltica
      t.boolean :coberta_xapa_acer
      t.boolean :coberta_xapa_coure
      t.boolean :coberta_aillament_termic

      t.timestamps null: false
    end
  end
end
