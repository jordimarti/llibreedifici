class CreateEntitats < ActiveRecord::Migration
  def change
    create_table :entitats do |t|
      t.integer :edifici_id
      t.string :nom_entitat
      t.decimal :superficie
      t.string :destinacio
      t.decimal :quota

      t.timestamps null: false
    end
  end
end
