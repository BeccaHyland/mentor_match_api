class StudentMentor < ActiveRecord::Migration[5.2]
  def change
    create_table :student_mentors do |t|
      t.references :mentor, foreign_key: true
      t.references :student, foreign_key: true
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
