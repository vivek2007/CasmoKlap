class RegistrationsController < Devise::RegistrationsController

  def create
    # TODO This should be in the model
    build_resource(sign_up_params)
    if params.has_key?("role") && params["role"].present?
      resource.add_role(:professional)
    else
      resource.add_role(:user)
    end
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.create_profile
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        # expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   response_to_sign_up_failure resource
    end
  end

  def after_sign_up_path_for(resource)
    if resource.is_professional?
      "/profiles/profile_avatar"
    else
      root_path
    end
    # if resource.is_appraiser?
    #   appraiser_steps_path
    # else
    #   after_sign_in_path_for(resource)
    # end
  end

end
