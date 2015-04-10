class AddSha1HashToFileAttachment < ActiveRecord::Migration
  def change
    add_column :file_attachments, :sha_1_hash, :string
  end
end
