class MyRegistrationsController < Devise::RegistrationsController
	prepend_view_path "app/views/devise"



	def create
		super
		puts "\n\n\n\n asdljfa;ldsjf;kdsajf \n\n\n\n\n"
		puts params
		User.create(params)
	end

end
