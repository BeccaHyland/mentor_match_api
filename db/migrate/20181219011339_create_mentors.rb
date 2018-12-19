class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :state
      t.string :slack_username
      t.string :linkedin_username
      t.string :github_username
      t.boolean :matched
      t.integer :user_id

      t.timestamps
    end
  end
end
