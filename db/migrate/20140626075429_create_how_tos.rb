class CreateHowTos < ActiveRecord::Migration
  def change
    create_table :how_tos do |t|
    	t.string :title
    	t.integer :likes

      t.timestamps
    end
  end
end
