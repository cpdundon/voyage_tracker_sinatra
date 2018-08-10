class Boat < ActiveRecord::Base
	has_many :voyages
	has_many :skippers, through: :voyages, class_name: 'Sailor' 
end
