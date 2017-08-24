class AddAttachmentDataToImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :images do |t|
      t.attachment :data
    end
  end

  def self.down
    remove_attachment :images, :data
  end
end
