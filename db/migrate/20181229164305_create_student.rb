class CreateStudent < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :pronouns
      t.string :email
      t.string :slack_username
      t.boolean :matched, default: false, null: false
      t.boolean :active, default: true, null:false
      t.text :background
      t.string :industries, default: [], array: true
      t.string :stack
      t.string :identity_marker, default: [], array: true

      t.timestamps
    end
  end
end
