class Voyage < ActiveRecord::Base
	belongs_to :skipper, class_name: 'Sailor'
	belongs_to :boat
end
