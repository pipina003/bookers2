class AddBodyToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :body, :text
    add_column :books, :title, :string
  end
end
