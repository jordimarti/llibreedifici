class CreateAscensors < ActiveRecord::Migration
  def change
    create_table :ascensors do |t|
      t.integer :edifici_id
      t.boolean :habitatge_unifamiliar
      t.boolean :edifici_comunitari
      t.boolean :mes_20_plantes
      t.boolean :altres

      t.timestamps null: false
    end
  end
end
