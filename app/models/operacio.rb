class Operacio < ActiveRecord::Base

	validates :periodicitat, :presence => true, numericality: true
	validates :periodicitat_text_ca, :presence => true
	validates :periodicitat_text_es, :presence => true
	validates :descripcio_ca, :presence => true
	validates :descripcio_es, :presence => true

end
