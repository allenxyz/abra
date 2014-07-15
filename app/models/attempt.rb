class Attempt < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>" },
                  :url  => "/assets/attempt/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attempt/:id/:style/:basename.:extension"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	
	belongs_to :user
	belongs_to :how_to

end
