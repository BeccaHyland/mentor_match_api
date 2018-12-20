class CreateMentorPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :mentor_preferences do |t|
      t.references :mentor, foreign_key: true
      t.references :preference, foreign_key: true
    end
  end
end
