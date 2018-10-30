class AddDislikesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :dislikes, :text
  end
end
