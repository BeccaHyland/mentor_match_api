class ChangeMentorMeetingLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :mentors, :meeting_location, :text

    add_column :mentors, :meeting_location, :string, array: true, default: []
  end
end
