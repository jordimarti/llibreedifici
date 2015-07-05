class CreateTancamentsVerticals < ActiveRecord::Migration
  def change
    create_table :tancaments_verticals do |t|
      t.integer :edifici_id
      t.boolean :acabat_vist_paredat
      t.boolean :acabat_vist_carreus
      t.boolean :acabat_vist_fabrica_mao
      t.boolean :acabat_vist_fabrica_bloc_ceramic
      t.boolean :acabat_vist_bloc_formigo
      t.boolean :acabat_vist_panell_formigo
      t.boolean :acabat_vist_panell_metalic_sandwich
      t.boolean :acabat_revestit_arrebossat_pintat
      t.boolean :acabat_revestit_estucat
      t.boolean :acabat_revestit_morter_monocapa
      t.boolean :acabat_revestit_aplacat_ceramic
      t.boolean :acabat_revestit_aplacat_pedra
      t.boolean :acabat_revestit_xapa_metalica
      t.boolean :cambra_aire_facana
      t.boolean :fusteria_fusta
      t.boolean :fusteria_acer
      t.boolean :fusteria_alumini
      t.boolean :fusteria_pvc
      t.boolean :vidre_simple
      t.boolean :vidre_doble
      t.boolean :vidre_triple
      t.boolean :vidre_baix_emissiu
      t.boolean :vidre_control_solar

      t.timestamps null: false
    end
  end
end
