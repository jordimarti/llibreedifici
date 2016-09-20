class CreateSignaturaLlibres < ActiveRecord::Migration
  def change
    create_table :signatura_llibres do |t|
      t.integer :edifici_id
      t.string :autor_llibre_nom
      t.string :autor_llibre_titulacio

      t.timestamps null: false
    end
  end
end
