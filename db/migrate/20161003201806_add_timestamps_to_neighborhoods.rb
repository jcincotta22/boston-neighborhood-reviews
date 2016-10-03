class AddTimestampsToNeighborhoods < ActiveRecord::Migration[5.0]
  def up
    add_timestamps(:neighborhoods)
  end

  def down
    remove_timestamps(:neighborhoods)
  end
end
