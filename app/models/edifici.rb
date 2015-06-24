class Edifici < ActiveRecord::Base

	belongs_to :user
	has_one :identificacio
	has_one :checklist_edifici_nou_plurifamiliar
	has_many :promotors
	has_many :projectistes

end
