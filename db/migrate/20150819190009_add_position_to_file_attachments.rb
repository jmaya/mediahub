class AddPositionToFileAttachments < ActiveRecord::Migration
  def change
    add_column :file_attachments, :position, :integer
  end
end
