class RemoveLikesFromHowTo < ActiveRecord::Migration
  def change
  	remove_column :how_tos, :likes
  end
end
