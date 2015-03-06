class AddBookToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book, :string
  end
end
