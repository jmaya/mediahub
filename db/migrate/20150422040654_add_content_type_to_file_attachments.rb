class AddContentTypeToFileAttachments < ActiveRecord::Migration
  def change
    add_column :file_attachments, :content_type, :string
  end
end
