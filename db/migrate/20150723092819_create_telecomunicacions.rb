class CreateTelecomunicacions < ActiveRecord::Migration
  def change
    create_table :telecomunicacions do |t|
      t.integer :edifici_id
      t.boolean :porter_audio
      t.boolean :porter_video
      t.boolean :antena_individual
      t.boolean :antena_colectiva
      t.boolean :parabolica_individual
      t.boolean :parabolica_colectiva
      t.boolean :telefonia
      t.boolean :riti
      t.boolean :rits
      t.boolean :ritu
      t.boolean :ritm

      t.timestamps null: false
    end
  end
end
