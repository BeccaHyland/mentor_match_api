class ChangeMentorAttributes < ActiveRecord::Migration[5.2]
  def change
    remove_column :mentors, :linkedin_username, :string
    remove_column :mentors, :github_username, :string
    remove_column :mentors, :program, :string

    add_column :mentors, :pronouns, :string
    add_column :mentors, :current_title, :string
    add_column :mentors, :current_employer, :string
    add_column :mentors, :industries, :string, array: true, default: []
    add_column :mentors, :background, :text
    add_column :mentors, :ways_to_mentor, :string, array: true, default: []
    add_column :mentors, :expertise_tech, :string, array: true, default: []
    add_column :mentors, :expertise_non_tech, :string, array: true, default: []

    add_column :mentors, :mentee_capacity, :integer
    add_column :mentors, :meeting_location, :text
  end
end
