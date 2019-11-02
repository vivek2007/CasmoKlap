class City < ApplicationRecord
	has_many :areas, :class_name => "City", :foreign_key => :parent_id, :dependent => :destroy
	has_one :parent, :class_name => "City", :primary_key => :parent_id, :foreign_key => :id
	has_many :users


end
