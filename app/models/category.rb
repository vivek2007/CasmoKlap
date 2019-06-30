class Category < ApplicationRecord
	attr_accessor :city

	# has_many :sub_categories, :dependent => :destroy
	# has_many :users
  has_many :sub_categories, :dependent => :destroy
  has_many :users, :through => :subcategory

	def self.search(options)
		where("lower(name) LIKE (?)", options[:name])
	end
end





