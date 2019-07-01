class Area < ApplicationRecord
	# has_many :cities, :class_name => "Area", :foreign_key => :parent_id, :dependent => :destroy
	# has_one :parent, :class_name => "Area", :primary_key => :parent_id, :foreign_key => :id
  belongs_to :city
	has_many :users
end
