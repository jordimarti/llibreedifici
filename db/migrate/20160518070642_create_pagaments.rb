class CreatePagaments < ActiveRecord::Migration
  def change
    create_table :pagaments do |t|
      t.integer :user_id
      t.integer :edifici_id
      t.bigint :numorder
      t.string :import
      t.string :resultado
      t.string :autorizacion

      t.timestamps null: false
    end
  end
end
