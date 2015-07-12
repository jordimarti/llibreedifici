class CreateSanejaments < ActiveRecord::Migration
  def change
    create_table :sanejaments do |t|
      t.integer :edifici_id
      t.boolean :no_sistema_evacuacio
      t.boolean :si_sistema_evacuacio
      t.boolean :fosa_septica
      t.boolean :bomba_elevacio
      t.boolean :separador_greixos
      t.boolean :baixants_vistos
      t.boolean :baixants_encastats
      t.boolean :baixants_ceramics
      t.boolean :baixants_pvc
      t.boolean :baixants_fibrociment
      t.boolean :baixants_coure
      t.boolean :baixants_alumini
      t.boolean :baixants_polipropile
      t.boolean :baixants_zinc
      t.boolean :colectors_vistos
      t.boolean :colectors_soterrats
      t.boolean :colectors_formigo
      t.boolean :colectors_ceramic
      t.boolean :colectors_fibrociment
      t.boolean :colectors_pvc

      t.timestamps null: false
    end
  end
end
