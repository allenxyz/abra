class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.float :rating
    	t.integer :user_id
    	t.integer :how_to_id
      t.timestamps
    end
  end
end
