class AddAttachmentPhotoToAttempts < ActiveRecord::Migration
  def self.up
    change_table :attempts do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :attempts, :photo
  end
end
