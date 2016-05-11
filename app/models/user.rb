class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :edificis
	#after_create :subscribe

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :nif, :presence => true

  def name
  	[first_name, last_name].compact.join(' ')
  end

  #def subscribe
	#  mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
	#  list_id = Rails.application.secrets.mailchimp_list_id
	#  result = mailchimp.lists(list_id).members.create(
	#    body: {
	#      email_address: self.email,
	#      status: 'subscribed'
	#  })
	#  Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
	#rescue Gibbon::MailChimpError => e
	#  Rails.logger.info("MailChimp subscribe failed for #{self.email}: " + e.message)
	#end
  
end
