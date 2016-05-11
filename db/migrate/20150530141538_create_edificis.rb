class CreateEdificis < ActiveRecord::Migration
  def change
    create_table :edificis do |t|
      t.integer :user_id
      t.string :nom_edifici
      t.string :tipus_edifici
      t.string :ref_cadastral

      t.timestamps null: false
    end
  end
end
