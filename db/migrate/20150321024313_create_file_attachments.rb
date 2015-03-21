class CreateFileAttachments < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|
      t.integer :course_id
      t.string :file
      t.timestamps
    end
  end
end
