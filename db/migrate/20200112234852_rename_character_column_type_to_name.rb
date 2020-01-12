class RenameCharacterColumnTypeToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :type, :name
  end
end
