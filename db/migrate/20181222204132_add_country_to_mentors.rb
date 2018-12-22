class AddCountryToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :country, :string, default: "US"
  end
end
