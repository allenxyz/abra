class UsersController < ApplicationController

	def profile
		@user = current_user
		@how_tos = current_user.how_tos
	end


	def edit
		@users = User.all
		@user = current_user
	end

	def show
		if !user_signed_in?
			@user = User.find(params[:id])
			@how_tos = @user.how_tos		
		elsif current_user.id == params[:id].to_i
			redirect_to "/profile"
		else
			@user = User.find(params[:id])
			@how_tos = @user.how_tos		
		end
	end



	def update
		p = params["user"]
		current_user.email = p['email'] if !(current_user.email == p['email'])
		current_user.first_name = p['first_name'] if !(current_user.first_name == p['last_name'])
		current_user.last_name = p['last_name'] if !(current_user.last_name == p['last_name'])
		current_user.profile_picture = p['profile_picture'] if p['profile_picture'] != nil
		current_user.save

		redirect_to '/profile'
	end


	def admin_edit_user
		if check_admin
			@all_users = User.all
		end
	end

	def admin_edit_howto
		if check_admin
			@all_howto = HowTo.all
		end
	end


	def promote
		if check_admin
			u = User.find(params[:id])
			u.admin = true
			u.save
			redirect_to :back
		end
	end

	def demote
		if check_admin
			u = User.find(params[:id])
			u.admin = false
			u.save
			redirect_to :back
		end
	end


	def destroy
		if check_admin
			u = User.find(params[:id])
			u.comments.delete_all
			u.likes.delete_all
			u.how_tos.delete_all
			u.delete
		end
		redirect_to :back
	end



	private


	
		def check_admin
			unless current_user.admin
				flash[:error] = "YOU DON'T PERMISSION TO GO TO THAT PAGE"
				redirect_to "/"
			end
			return true
		end




	


end
