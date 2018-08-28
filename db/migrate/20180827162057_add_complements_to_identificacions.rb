class AddComplementsToIdentificacions < ActiveRecord::Migration
  def change
  	add_column :identificacions, :data_llicencia_municipal, :string 
		add_column :identificacions, :num_llicencia_municipal, :string 
		add_column :identificacions, :data_finalitzacio_obres, :string 
		add_column :identificacions, :visat_finalitzacio_obres, :string 
		add_column :identificacions, :data_recepcio_definitiva, :string 
		add_column :identificacions, :visat_recepcio_definitiva, :string 
		add_column :identificacions, :data_llicencia_primera_ocupacio, :string 
		add_column :identificacions, :num_llicencia_primera_ocupacio, :string 
		add_column :identificacions, :data_llicencia_activitats_parquing, :string 
		add_column :identificacions, :num_llicencia_activitats_parquing, :string 
		add_column :identificacions, :data_qualificacio_provisional_vpo, :string 
		add_column :identificacions, :num_qualificacio_provisional_vpo, :string 
		add_column :identificacions, :data_qualificacio_definitiva_vpo, :string 
		add_column :identificacions, :num_qualificacio_definitiva_vpo, :string 
		add_column :identificacions, :nom_notari, :string 
		add_column :identificacions, :adreca_notari, :text
		add_column :identificacions, :data_escriptures, :string 
		add_column :identificacions, :num_protocol_escriptures, :string 
		add_column :identificacions, :data_declaracio_obra_nova, :string 
		add_column :identificacions, :tom_inscripcio_registral, :string 
		add_column :identificacions, :foli_inscripcio_registral, :string 
		add_column :identificacions, :llibre_inscripcio_registral, :string 
		add_column :identificacions, :finca_inscripcio_registral, :string 
		add_column :identificacions, :registre_de_inscripcio_registral, :string
  end
end
