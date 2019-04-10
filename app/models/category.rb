class Category < ApplicationRecord
	has_many :sub_categories, :dependent => :destroy
	has_many :users


	def self.search(options)
		where("lower(name) LIKE (?)", options[:name])
	end
end





