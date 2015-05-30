class Edifici < ActiveRecord::Base

	has_one :dades_edifici_nou
	has_one :checklist_edifici_nou_plurifamiliar

	accepts_nested_attributes_for :checklist_edifici_nou_plurifamiliar, :dades_edifici_nou
end
