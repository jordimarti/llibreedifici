class CreateLaboratoris < ActiveRecord::Migration
  def change
    create_table :laboratoris do |t|
      t.integer :edifici_id
      t.string :nom_laboratori
      t.string :nif_laboratori

      t.timestamps null: false
    end
  end
end
