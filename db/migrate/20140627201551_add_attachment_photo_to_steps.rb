class AddAttachmentPhotoToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :steps, :photo
  end
end
