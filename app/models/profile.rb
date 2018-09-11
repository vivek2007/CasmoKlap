class Profile < ApplicationRecord
	belongs_to :user
	has_many :work_photos
	has_many :references
	has_many :certificates

	has_attached_file :avatar, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename", 
      :styles => { :smal => "200x200>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	
	has_attached_file :id_front_image, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename", 
      :styles => { :smal => "200x200>" }
  validates_attachment_content_type :id_front_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :id_back_image, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename", 
      :styles => { :smal => "200x200>" }
  validates_attachment_content_type :id_back_image, content_type: /\Aimage\/.*\z/
end
