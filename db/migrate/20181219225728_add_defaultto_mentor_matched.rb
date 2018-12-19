class AddDefaulttoMentorMatched < ActiveRecord::Migration[5.2]
  def change
    change_column :mentors, :matched, :boolean, null: false, default: false
  end
end
