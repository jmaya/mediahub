class AddFileBasenameToFileAttachments < ActiveRecord::Migration
  def change
    add_column :file_attachments, :file_basename, :string
  end
end
