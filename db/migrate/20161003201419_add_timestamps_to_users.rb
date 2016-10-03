class AddTimestampsToUsers < ActiveRecord::Migration[5.0]
  def up
    add_timestamps(:users)
  end

  def down
    remove_timestamps(:users)
  end
end
