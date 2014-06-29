class CommentsController < ApplicationController

	def create
		puts params
		Comment.create(comment_params)
		redirect_to "/show/#{params[:comment][:how_to_id]}"


	end

	private
		def comment_params
	  		params.require(:comment).permit(:user_id, :how_to_id, :text)
		end


end
