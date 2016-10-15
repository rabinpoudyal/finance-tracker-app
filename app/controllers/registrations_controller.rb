class RegistrationsController < Devise::RegistrationsController

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:f_name,:l_name])
      devise_parameter_sanitizer.permit(:update, keys: [:f_name,:l_name])
  end

end
