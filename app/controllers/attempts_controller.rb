class AttemptsController < ApplicationController
	def new
		puts params
		@new_attempt = Attempt.new
	end



	def create
		puts "asdfasdfasdf"
		a = Attempt.create(attempt_params)
		puts attempt_params
		puts params
		redirect_to "/show/#{params[:attempt][:how_to_id]}"
	end


	private

		def attempt_params
			params.require(:attempt).permit(:photo, :caption, :how_to_id)
		end


end
