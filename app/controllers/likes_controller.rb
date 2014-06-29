class LikesController < ApplicationController
	def like
		HowTo.find(params[:how_to_id]).likes.each do |like|
			if like.user == current_user
				flash[:error] = "You already like this!"
			end
		end

		Like.create(:user_id => current_user.id, :how_to_id => params[:how_to_id])
		redirect_to "/show/#{params[:how_to_id]}"
	end


	def unlike
		Like.find_by(:user_id => current_user.id, :how_to_id => params[:how_to_id]).delete
		redirect_to "/show/#{params[:how_to_id]}"
	end


end
