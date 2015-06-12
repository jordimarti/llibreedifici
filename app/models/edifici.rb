class Edifici < ActiveRecord::Base

	has_one :dades_edifici_nou
	has_one :checklist_edifici_nou_plurifamiliar

end
