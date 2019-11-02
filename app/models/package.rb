class Package < ApplicationRecord
	has_many :subpackages, :class_name => "Package", :foreign_key => :parent_id, :dependent => :destroy
	has_one :parent, :class_name => "Package", :primary_key => :parent_id, :foreign_key => :id
end
