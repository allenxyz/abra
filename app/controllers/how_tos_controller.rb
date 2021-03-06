class HowTosController < ApplicationController

	def index
		length = 3

		@user = current_user
		@howtos = HowTo.all
		@most_likes = HowTo.find_most_likes(@howtos, length)
		@most_commented = HowTo.find_most_comments(@howtos, length)
		@most_attempts = HowTo.find_most_attempts(@howtos, length)
		@latest = []
		ctr = 1
		1.upto(length) do 
			break if (ctr-1) == length
			@latest << HowTo.all.reverse[ctr - 1]
			ctr += 1
		end
	end

	def new
		@HowTo = HowTo.new
		@user = current_user
	end


	def create
		puts params
		@howto = HowTo.create(:title => params[:how_to][:title], :user_id => params[:how_to][:user_id])
		redirect_to '/steps/new'
	end

	def show
		@howto = HowTo.find(params[:how_to_id])
		@steps = @howto.steps
		@comments = @howto.comments
		@user = @howto.user
		@likes = @howto.likes.size
		@liked = false

		@howto.likes.each do |like|
			@liked = true if like.user == current_user
		end

		@new_comment = Comment.new

		@attempts = @howto.attempts

	end

	def delete
		h = HowTo.find(params[:how_to_id])		
		h.steps.delete_all
		h.comments.delete_all
		h.attempts.delete_all
		h.likes.delete_all
		h.destroy
		redirect_to :back
	end

	def random
		index = rand(HowTo.last.id) + 1
		while !HowTo.find_by(:id => index)
			index = rand(HowTo.last.id) + 1
		end
		puts index

		redirect_to "/show/#{index}"
	end



	def new_rating


		redirect_to :back

	end


	private

	  	def how_to_params
	  		params.require(:how_to).permit(:user_id, :title)
	  	end

	
end
