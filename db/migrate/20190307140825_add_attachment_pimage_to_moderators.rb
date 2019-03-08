class AddAttachmentPimageToModerators < ActiveRecord::Migration[5.2]
  def self.up
    change_table :moderators do |t|
      t.attachment :pimage
    end
  end

  def self.down
    remove_attachment :moderators, :pimage
  end
end
