class Qualification < ApplicationRecord
	belongs_to :profile, optional: true
end
