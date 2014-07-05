class UsersController < ApplicationController

	def profile
		@user = current_user
		@how_tos = current_user.how_tos
	end


	def edit
		@users = User.all
		@user = current_user
	end


	def modify

	end


end
