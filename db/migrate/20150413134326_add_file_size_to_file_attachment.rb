class AddFileSizeToFileAttachment < ActiveRecord::Migration
  def change
    add_column :file_attachments, :file_size, :integer
  end
end
