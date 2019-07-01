class Certificate < ApplicationRecord
	belongs_to :profile, optional: true
	
	#has_attached_file :certificate_avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :certificate_avatar, content_type: /\Aimage\/.*\z/
end
