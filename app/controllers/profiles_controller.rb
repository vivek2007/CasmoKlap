class ProfilesController < ApplicationController
	include Wicked::Wizard
  # before_action :set_category, only: [:show, :edit, :update]

  steps :profile_avatar, :identity_proof, :current_address, :about_me, :award_and_certificate, :service_location, :refrences, :work_photos


  def create
  end

  def show
    if current_user.profile.present?
      @profile = current_user.profile
    else
      @profile = current_user.build_profile  
    end
    @profile[:last_step] = params[:id]
    @profile.save
    @current_step = step
  	render_wizard
  end

  def edit
  end

  def update
    @profile = current_user.profile
    debugger
    @profile.attributes = (profile_params || params[:customer] || {}) 
    @profile[:last_step] = params[:id]
    debugger
    render_wizard @profile
  end

  private

  def profile_params
    if params[:id] == "profile_avatar"
      params.require(:profile).permit(:avatar)
    elsif params[:id] == "identity_proof"
      params.require(:profile).permit(:id_front_image, :id_back_image, :id_type, :name_on_id, :id_number)
    elsif params[:id] == "current_address"
      params.require(:profile).permit(:lane1, :lan2, :colony, :state, :country)
    elsif params[:id] == "about_me"
    end
      
  end

end