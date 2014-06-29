class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.integer :user_id
    	t.integer :how_to_id
      t.timestamps
    end
  end
end
