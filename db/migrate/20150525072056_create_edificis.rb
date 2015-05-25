class CreateEdificis < ActiveRecord::Migration
  def change
    create_table :edificis do |t|
      t.integer :user_id
      t.string :nom

      t.timestamps null: false
    end
  end
end
