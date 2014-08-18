class ChangeUserNameToNickName < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :nickname, :string
  end
end
