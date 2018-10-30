class AddLikesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :likes, :text
  end
end
