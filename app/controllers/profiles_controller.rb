class ProfilesController < ApplicationController
	include Wicked::Wizard
  # before_action :set_category, only: [:show, :edit, :update]

  steps :profile_avatar, :identity_proof, :current_address, :about_me, :award_and_certificate, :work_photos


  def create
  end

  def show
    if current_user.profile.present?
      @profile = current_user.profile
    # else
    #   @profile = current_user.build_profile  
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
    @profile.attributes = (profile_params || params[:customer] || {}) 
    @profile[:last_step] = params[:id]
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
      params.require(:profile).permit(:qualification,:experiance,:alternate_contact,:main_contact,:online_presence,:business_name,:price_per_session,:specialization,:localities,:introduction,:degree_available,:service_location,qualifications_attributes:[:name,:_destroy,:id], references_attributes:[:name, :contact, :_destroy,:id])
    elsif params[:id] == "award_and_certificate"
      params.require(:profile).permit(certificates_attributes:[:certificate_avatar, :_destroy,:id])
    # elsif params[:id] == "service_location"
    #   params.require(:profile).permit()
    # elsif params[:id] == "refrences"
    elsif params[:id] == "work_photos"
      params.require(:profile).permit(work_photos:[:photo_file, :_destroy,:id])
    end
      
  end

end