class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, null:false
      t.references :favorited, plymorphic: true, index: true
      t.string :favorited_type, null:false

      t.timestamps null: false
    end
    add_foreign_key :favorites, :users
  end
end
