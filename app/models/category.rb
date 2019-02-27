class Category < ApplicationRecord
	has_many :sub_categories, :dependent => :destroy
	has_many :users
end





