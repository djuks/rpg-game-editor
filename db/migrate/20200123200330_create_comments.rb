class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.integer :character_id

    end
  end
end