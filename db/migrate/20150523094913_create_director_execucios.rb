class CreateDirectorExecucios < ActiveRecord::Migration
  def change
    create_table :director_execucios do |t|
      t.integer :edifici_id
      t.string :nom_director_execucio
      t.string :titulacio_director_execucio
      t.string :rao_social_director_execucio
      t.string :nif_director_execucio

      t.timestamps null: false
    end
  end
end
