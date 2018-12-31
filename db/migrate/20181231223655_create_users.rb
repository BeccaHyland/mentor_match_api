class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role, default: "user"
      t.string :login
      t.string :avatar_url

      t.timestamps
    end
  end
end
