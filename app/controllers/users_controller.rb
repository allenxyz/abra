class UsersController < ApplicationController

	def profile
		@user = current_user
		@how_tos = current_user.how_tos
	end

end
