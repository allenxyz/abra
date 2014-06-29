class AddHowToIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :how_to_id, :integer
  end
end
