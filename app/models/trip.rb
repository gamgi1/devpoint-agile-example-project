class Trip < ActiveRecord::Base
	has_many :destinations
	belongs_to :user

	def really_far?
		self.total_miles > 1500
	end

	def self.by_total_miles
		order(total_miles: :desc)
	end

	def print_user
		self.user.name
	end

end
