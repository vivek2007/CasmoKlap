class Message < ApplicationRecord
  validates :location, :address, :full_name, :serve_on, :contact_on, :sub_category_id, :sent_to, :presence => true

  ADMIN_PHONE = "9160940328"

  def Message.twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_messages host_with_port
    message_hash = {}
    user = User.where(id: self.sent_to).last
    message_hash[self.contact_on] = "Dear #{self.full_name}, Your message successfully received by professional #{user.try(:first_name)} #{user.try(:last_name)}."
    if user.present?
      message_hash[user.phone] = "Dear Professional, #{self.full_name} sent you reuest for your service on #{self.serve_on} at #{self.location} #{address}. Click on below link to Accept/Reject. #{host_with_port}/professional_response?prof_id=#{user.id}&message_id=#{self.id}"
    end
    message_hash[Message::ADMIN_PHONE] = "Dear Admin, #{self.full_name} requested to professional #{user.try(:first_name)} #{user.try(:last_name)} on this number #{user.try(:phone)}, dated #{self.serve_on} at #{self.location} #{address}.".html_safe
    contacts_arr = [self.contact_on, user.phone, Message::ADMIN_PHONE]
    begin
      contacts_arr.each do |contact|
        Message.twilio_client.messages.create(
          body: "#{message_hash[contact]}", 
          #from: '+19712056208',
          from: '+14695572455',       
          to: '+91'+contact.to_s
        )
      end
    rescue Exception => e
      
    end
  end
end
