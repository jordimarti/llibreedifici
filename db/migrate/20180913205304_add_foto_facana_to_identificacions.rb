class AddFotoFacanaToIdentificacions < ActiveRecord::Migration
  def change
  	add_attachment :identificacions, :foto_facana_2
  	add_attachment :identificacions, :foto_facana_3
  end
end
