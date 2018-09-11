class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :city, :category_id, :phone, :email, :password) }
	end

	def after_sign_up_path_for(resource)
    # if resource.is_appraiser?
      profile_path
    # end
  end
end


  # devise_parameter_sanitizer.permit(:sign_up, keys: [:primary_profession])


