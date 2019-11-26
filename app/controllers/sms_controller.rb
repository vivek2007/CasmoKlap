class SmsController < ApplicationController

  def send_sms
    @message = Message.new(permit_message_params)
    # lookup_client = Message.twilio_client
    # phone_number = lookup_client.lookups.phone_numbers(params[:message][:contact_on])
    respond_to do |format|
      begin
        # response = phone_number.fetch
          if @message.valid?
            @message.save
            @message.send_messages request.host_with_port
            format.js
            format.json
          else
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
      rescue Twilio::REST::RestError => e
        @message.errors.messages[:contact_on] = ["Invalid Number"]
        if e.code == 20404
          format.json { render json: @message.errors, status: :unprocessable_entity }
        else
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def professional_response
    @message = Message.find(params[:message_id])
    render :partial => "professional_response", :layout => false
  end

  def accept_or_reject
    @message = Message.find(params[:message][:message_id])
    @message.update(status: params[:message][:status])
    redirect_to root_path
  end

  def send_sms_for_register_user
    user = User.where("email"=>params[:email], "phone"=>params[:phone]).last
    if user.present?
      @user.send_messages
      format.json
      format.js
    else
      @ajax_error = 'You are not registered with either email or mobile number'
    end
  end

  private

  def permit_message_params
    params.require(:message).permit(:full_name, :location, :address, :sub_category_id, :serve_on, :contact_on, :email, :sent_to)
  end

end