class AddStackPreferenceToMentors < ActiveRecord::Migration[5.2]
  def change
    remove_column :mentors, :preference
    add_column :mentors, :stack_preference, :string, default: "no preference"
  end
end
