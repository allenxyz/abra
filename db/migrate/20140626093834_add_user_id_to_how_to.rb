class AddUserIdToHowTo < ActiveRecord::Migration
  def change
  	add_column :how_tos, :user_id, :integer
  end
end
