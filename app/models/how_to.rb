class HowTo < ActiveRecord::Base
	validates :title, presence: true
	validates :title, length: {maximum: 30}



	belongs_to :user
	has_many :steps
	has_many :comments
	has_many :attempts
	has_many :likes
	has_many :ratings

	def self.find_most_likes(howtos, length)
		return HowTo.findmax(howtos, "like", length)
	end

	def self.find_most_comments(howtos, length)
		return HowTo.findmax(howtos, "comment", length)
	end

	def self.find_most_attempts(howtos, length)
		return HowTo.findmax(howtos, "attempt", length)
	end
	def self.find_newset(howtos, length)
		return HowTo.findmax(howtos, "newest", length)
	end

	
	def self.findmax(howtos, sortby, length)
		max = []

		1.upto(length) do 
			maxhow_temp = nil
			max_temp = -1
			howtos.each do |howto|
				size = howto.likes.size if sortby == "like"
				size = howto.comments.size if sortby == "comment"
				size = howto.attempts.size if sortby == "attempt"
				size = howto.created_at if sortby == "newest"

				if size > max_temp
					next if max.include?(howto)
					max_temp = size
					maxhow_temp = howto
				end
			end
			max << maxhow_temp
		end
		return max
	end


		## only for top 3
		# howtos.each do |howto|
		# 	if size > max[0]
		# 		#change 3 to 2
		# 		max[2]= max[1]
		# 		maxhow[2] = maxhow[1]
		# 		#change 2 to 1
		# 		max[1] = max[0]
		# 		maxhow[1] = maxhow[0]
		# 		#change 1 to this
		# 		max[0] = size
		# 		maxhow[0] = howto

		# 	elsif size > max[1]
		# 		#change 2 to 3
		# 		max[2] = max[1]
		# 		maxhow[2] = maxhow[1]
		# 		#change 2 to this
		# 		max[1] = size
		# 		maxhow[1] = howto

		# 	elsif size > max[2]
		# 		#change 3 to this
		# 		max[2] = size
		# 		maxhow[2] = howto
		# 	end
		# end




	# #incase i ever need this
	# def quicksort(list, p, r)
	#     if p < r then
	#         q = partition(list, p, r)
	#         quicksort(list, p, q-1)
	#         quicksort(list, q+1, r)
	#     end
	# end
	 
	# def partition(list, p, r)
	#     pivot = list[r]
	#     i = p - 1
	#     p.upto(r-1) do |j|
	#         if list[j] <= pivot
	#             i = i+1
	#             list[i], list[j] = list[j],list[i]
	#         end       
	#     end
	#     list[i+1],list[r] = list[r],list[i+1]
	#     return i + 1
	# end



end
