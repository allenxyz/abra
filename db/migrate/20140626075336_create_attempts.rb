class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|

    	t.text :caption

      t.timestamps
    end
  end
end
