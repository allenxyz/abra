class Comment < ActiveRecord::Base
	belongs_to :how_to
	belongs_to :user
end
