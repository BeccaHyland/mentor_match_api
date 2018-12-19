class RemoveUserIdFromMentors < ActiveRecord::Migration[5.2]
  def change
    remove_column :mentors, :user_id
  end
end
