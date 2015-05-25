class CreateProjectista < ActiveRecord::Migration
  def change
    create_table :projectista do |t|
      t.integer :edifici_id
      t.string :nom_projectista
      t.string :titulacio_projectista
      t.string :rao_social_projectista
      t.string :nif_projectista

      t.timestamps null: false
    end
  end
end
