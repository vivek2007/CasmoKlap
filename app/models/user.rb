class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  has_one :profile, dependent: :destroy
  #belongs_to :category, optional: true
  belongs_to :sub_category, optional: true
  belongs_to :area, optional: true
  validates_acceptance_of :terms
  validate :first_name
  validate :last_name
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  attr_accessor :terms, :professional_id

  def self.roles
    %w[admin user professional]
  end

  def admin?
    self.has_all_roles? :admin
  end

  def is_customer?
    self.has_all_roles? :user
  end

  def is_professional?
    self.has_all_roles? :professional
  end

  def get_last_step
    self.last_step.nil? ? :identity_proof : self.last_step
  end

  def twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_messages(professional_id)
    # [self, User.where(id: professional_id).last].each do |user|
      self.twilio_client.messages.create(
        body: 'Hello Arindam, how r u?', 
        #from: '+19712056208',
        from: '+14695572455',       
        to: '+91'+self.phone.to_s 
      )
    # end
  end
end
