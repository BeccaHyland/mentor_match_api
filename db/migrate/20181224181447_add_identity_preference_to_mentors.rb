class AddIdentityPreferenceToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :identity_preference, :string, array: true, default: []
  end
end
