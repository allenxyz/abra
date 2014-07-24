class AttemptsController < ApplicationController
	def new
		puts params
		@new_attempt = Attempt.new
	end



	def create
		a = Attempt.create(attempt_params)
		puts a.photo
		redirect_to "/show/#{params[:attempt][:how_to_id]}"
	end


	private

		def attempt_params
			params.require(:attempt).permit(:photo, :caption, :how_to_id, :user_id)
		end


end
