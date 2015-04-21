class AddCounterCacheToFileAttachments < ActiveRecord::Migration
  def change
    add_column :courses, :file_attachments_count, :integer, default:0
  end
end
