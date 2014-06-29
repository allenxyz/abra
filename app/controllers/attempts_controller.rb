class AttemptsController < ApplicationController
	def new
		@new_attempt = Attempt.new
	end



	def create
		Attempt.create(attempt_params)
	end


	private

		def attempt_params
			params.require(:attempt).permit(:photo, :caption, :how_to_id)
		end


end
