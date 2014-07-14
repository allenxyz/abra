class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :how_to
end
