class CreateFonamentacions < ActiveRecord::Migration
  def change
    create_table :fonamentacions do |t|
      t.integer :edifici_id
      t.boolean :mur_pedra
      t.boolean :mur_fabrica_mao
      t.boolean :mur_fabrica_bloc
      t.boolean :mur_formigo_armat
      t.boolean :mur_pantalla
      t.boolean :drenatge_perimetral
      t.boolean :sabates_paredat
      t.boolean :sabates_aillades
      t.boolean :sabates_continues
      t.boolean :llosa
      t.boolean :formigo
      t.boolean :formigo_armat
      t.boolean :pilons
      t.boolean :pantalles

      t.timestamps null: false
    end
  end
end
