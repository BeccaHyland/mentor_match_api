class AddAttributesToMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :program, :string
    add_column :mentors, :active, :boolean, null: false, default: true
  end
end
