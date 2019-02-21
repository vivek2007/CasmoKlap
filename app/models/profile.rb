class Profile < ApplicationRecord
	belongs_to :user
	has_many :qualifications
	accepts_nested_attributes_for :qualifications, allow_destroy: true
	has_many :references
	accepts_nested_attributes_for :references, allow_destroy: true
	has_many :work_photos
	accepts_nested_attributes_for :work_photos, allow_destroy: true
	has_many :certificates
	accepts_nested_attributes_for :certificates, allow_destroy: true


	# has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 #  has_attached_file :id_front_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :id_front_image, content_type: /\Aimage\/.*\z/

 #  has_attached_file :id_back_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :id_back_image, content_type: /\Aimage\/.*\z/
end
