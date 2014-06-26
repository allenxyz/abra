class HowTosController < ApplicationController

	def index

		@user = current_user

	end
	
end
