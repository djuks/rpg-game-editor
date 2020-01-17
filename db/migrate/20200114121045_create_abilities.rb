class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.references :character, null: false, foreign_key: true
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
