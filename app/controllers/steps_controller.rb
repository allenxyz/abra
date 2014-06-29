class StepsController < ApplicationController
	def new
		@step = Step.new
		@how_to = current_user.how_tos.last
	end

	def create

		@step = Step.create( step_params )

		if params[:commit] == "Add another step!"
			redirect_to "/steps/new"
		elsif params[:commit] == "Finished!"
			redirect_to "/show/#{params[:step][:how_to_id]}"
		end



	end



  private

  	def step_params
  		params.require(:step).permit(:photo, :caption, :how_to_id)
  	end




end
