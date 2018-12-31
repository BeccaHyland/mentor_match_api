class ChangeUserAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: "user"
    add_column :users, :login, :string

    remove_column :users, :password_digest
    remove_column :users, :email
  end
end
