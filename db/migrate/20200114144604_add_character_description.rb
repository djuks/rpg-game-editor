class AddCharacterDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :description, :text
  end
end
