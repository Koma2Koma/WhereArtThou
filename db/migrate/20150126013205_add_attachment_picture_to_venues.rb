class AddAttachmentPictureToVenues < ActiveRecord::Migration
  def self.up
    change_table :venues do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :venues, :picture
  end
end
