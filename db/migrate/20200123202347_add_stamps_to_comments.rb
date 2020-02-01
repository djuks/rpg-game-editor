class AddStampsToComments < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:comments, null: false)
  end
end
