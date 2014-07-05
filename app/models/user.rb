class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	 has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "50x50>" },
	 		  :default_url => "../../assets/missing.jpg", 
	          :url  => "/assets/user/:id/:style/:basename.:extension",
	          :path => ":rails_root/public/assets/user/:id/:style/:basename.:extension"
	validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/	    
	validates_attachment_presence :profile_picture
	validates_attachment_size :profile_picture, :less_than => 5.megabytes

	has_many :how_tos
	has_many :likes
	has_many :comments
end
