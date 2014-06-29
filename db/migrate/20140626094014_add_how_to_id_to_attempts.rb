class AddHowToIdToAttempts < ActiveRecord::Migration
  def change
  	add_column :attempts, :how_to_id, :integer
  end
end
