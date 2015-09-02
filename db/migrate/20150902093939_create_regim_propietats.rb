class CreateRegimPropietats < ActiveRecord::Migration
  def change
    create_table :regim_propietats do |t|
      t.integer :edifici_id
      t.string :tipus_regim_propietat
      t.string :document_escriptura

      t.timestamps null: false
    end
  end
end
