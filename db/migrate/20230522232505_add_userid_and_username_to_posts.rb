class AddUseridAndUsernameToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :string
    add_column :users, :username, :string
  end
end
