class AddDislikedBooksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :disliked_books, :text
  end
end
