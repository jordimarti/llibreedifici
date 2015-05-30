class DadesEdificiNou < ActiveRecord::Base
	has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/

	belongs_to :edifici, inverse_of: :dades_edifici_nou

end
