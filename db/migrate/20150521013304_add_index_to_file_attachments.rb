class AddIndexToFileAttachments < ActiveRecord::Migration
  def change
    add_index :file_attachments, :sha_1_hash, unique:true
  end
end
