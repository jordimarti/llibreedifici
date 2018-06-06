class Operacio < ActiveRecord::Base

	validates :periodicitat, :presence => true, numericality: true

end
