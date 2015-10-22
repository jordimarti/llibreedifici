class CreateReferenciaCalendaris < ActiveRecord::Migration
  def change
    create_table :referencia_calendaris do |t|
      t.integer :edifici_id
      t.integer :operacio_id
      t.integer :any

      t.timestamps null: false
    end
  end
end
