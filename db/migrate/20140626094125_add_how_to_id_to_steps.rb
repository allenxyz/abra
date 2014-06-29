class AddHowToIdToSteps < ActiveRecord::Migration
  def change
  	add_column :steps, :how_to_id, :integer
  end
end
