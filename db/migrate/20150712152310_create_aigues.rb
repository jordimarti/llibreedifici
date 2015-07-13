class CreateAigues < ActiveRecord::Migration
  def change
    create_table :aigues do |t|
      t.integer :edifici_id
      t.boolean :connexio_directa
      t.boolean :connexio_aforament
      t.boolean :captacio_propia
      t.boolean :comptador_unic
      t.boolean :comptadors_individuals_habitatge
      t.boolean :comptadors_individuals_centralitzats
      t.boolean :grup_pressio
      t.boolean :muntants_plom
      t.boolean :muntants_ferro
      t.boolean :muntants_coure
      t.boolean :muntants_plastic

      t.timestamps null: false
    end
  end
end
