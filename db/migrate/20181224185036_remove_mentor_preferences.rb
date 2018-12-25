class RemoveMentorPreferences < ActiveRecord::Migration[5.2]
  def change
    drop_table :mentor_preferences
    drop_table :preferences
  end
end
