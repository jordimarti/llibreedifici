class Edifici < ActiveRecord::Base

	belongs_to :user
	has_one :dades_edifici_nou
	has_one :checklist_edifici_nou_plurifamiliar

end
