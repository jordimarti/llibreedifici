class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :edificis
	before_create :subscribe

  def name
  	[first_name, last_name].compact.join(' ')
  end

  def subscribe
	  mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
	  list_id = Rails.application.secrets.mailchimp_list_id_llibreedifici
	  result = mailchimp.lists(list_id).members.create(
	    body: {
	      email_address: 'joho@edificapro.com',
	      status: 'subscribed'
	  })
	  Rails.logger.info("Subscribed joho@edificapro.com to MailChimp") if result
	rescue Gibbon::MailChimpError => e
	  Rails.logger.info("MailChimp subscribe failed for joho@edificapro.com: " + e.message)
	end
  
end
