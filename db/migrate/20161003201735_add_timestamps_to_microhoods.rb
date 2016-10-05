class AddTimestampsToMicrohoods < ActiveRecord::Migration[5.0]
  def up
    add_timestamps(:microhoods)
  end

  def down
    remove_timestamps(:microhoods)
  end
end
