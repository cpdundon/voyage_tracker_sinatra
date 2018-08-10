class Sailor < ActiveRecord::Base
	has_secure_password
	has_many :voyages, foreign_key: 'skipper_id'
	has_many :boats, through: :voyages
end
