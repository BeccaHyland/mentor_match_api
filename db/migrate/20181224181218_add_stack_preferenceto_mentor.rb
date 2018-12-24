class AddStackPreferencetoMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :stack_preference, :string, array: true, default: []
  end
end
