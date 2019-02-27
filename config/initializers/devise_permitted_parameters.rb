module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :nif << :role
	devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :nif << :role
  end

end

DeviseController.send :include, DevisePermittedParameters