class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  has_one :profile
  belongs_to :category, optional: true

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
end
