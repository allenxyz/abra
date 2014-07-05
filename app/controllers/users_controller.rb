class UsersController < ApplicationController

	def profile
		@user = current_user
		@how_tos = current_user.how_tos
	end


	def edit
		@users = User.all
		@user = current_user
	end


	def update
		puts params
		p = params["user"]
		current_user.email = p['email'] if current_user.email == p['email']
		current_user.first_name = p['first_name'] if current_user.first_name == p['last_name']
		current_user.last_name = p['last_name'] if current_user.last_name == p['last_name']

		redirect_to '/profile'
	end


	def update

		
	end
	


end
