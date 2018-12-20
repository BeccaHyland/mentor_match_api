class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
    t.string :title
    
    t.timestamps
    end
  end
end
