class CreateInscripcioRegistrals < ActiveRecord::Migration
  def change
    create_table :inscripcio_registrals do |t|
      t.integer :edifici_id
      t.string :data
      t.string :tom
      t.string :foli
      t.string :llibre
      t.string :numero_finca
      t.string :registre

      t.timestamps null: false
    end
  end
end
