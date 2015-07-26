class CreateEspecials < ActiveRecord::Migration
  def change
    create_table :especials do |t|
      t.integer :edifici_id
      t.boolean :piscina_estructura_obra
      t.boolean :piscina_estructura_composite
      t.boolean :piscina_estructura_acer
      t.boolean :piscina_vores_formigo
      t.boolean :piscina_vores_pedra
      t.boolean :piscina_ceramica
      t.boolean :piscina_resines
      t.boolean :piscina_porcellana
      t.boolean :piscina_climatitzacio
      t.boolean :piscina_iluminacio
      t.boolean :piscina_purificador

      t.timestamps null: false
    end
  end
end
