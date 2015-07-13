class CreateIncendis < ActiveRecord::Migration
  def change
    create_table :incendis do |t|
      t.integer :edifici_id
      t.boolean :alarma_automatica
      t.boolean :alarma_manual
      t.boolean :extintors
      t.boolean :abastiment_aigua
      t.boolean :bie
      t.boolean :hidrants
      t.boolean :ruixadors
      t.boolean :columnes_seques
      t.boolean :parallamps

      t.timestamps null: false
    end
  end
end
