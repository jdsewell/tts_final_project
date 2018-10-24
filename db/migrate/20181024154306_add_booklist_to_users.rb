class AddBooklistToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :book_list, :text
  end
end
