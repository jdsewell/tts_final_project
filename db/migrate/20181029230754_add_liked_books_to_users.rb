class AddLikedBooksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :liked_books, :text
  end
end
