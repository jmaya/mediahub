class CreateVideoPlayerTrackers < ActiveRecord::Migration
  def change
    create_table :video_player_trackers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :file_attachment, index: true
      t.integer :left_at

      t.timestamps null: true
    end
  end
end
