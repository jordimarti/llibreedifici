class CreateAptitudCertificats < ActiveRecord::Migration
  def change
    create_table :aptitud_certificats do |t|
      t.integer :edifici_id
      t.string :numero_expedient
      t.string :codi_informe
      t.string :data_ite
      t.string :certificat_aptitud
      t.string :data_programa
      t.string :necessitat_verificacions_tecniques
      t.string :periodicitat_verificacions_tecniques

      t.timestamps null: false
    end
  end
end
