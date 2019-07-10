class SmsController < ApplicationController

  def send_sms
    @user = User.new(permit_user)
    @user.password = "password"
    @user.password_confirmation = "password"
    respond_to do |format|
      if @user.valid?
        @user.save
        @user.send_messages(params["user"]["professional_id"])
        format.js
        format.json
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def permit_user
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end

end