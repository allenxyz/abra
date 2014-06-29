class HowTo < ActiveRecord::Base
	belongs_to :user
	has_many :steps
	has_many :comments
	has_many :attempts
	has_many :likes




end
