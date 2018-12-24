class AddPreferencetoMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :preference, :string, default: "no preference"
  end
end
