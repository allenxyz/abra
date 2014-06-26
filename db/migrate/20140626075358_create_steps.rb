class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|

    	t.text :caption
    	#photo added in paperclip later on



      t.timestamps
    end
  end
end
