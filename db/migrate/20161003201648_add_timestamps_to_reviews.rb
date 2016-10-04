class AddTimestampsToReviews < ActiveRecord::Migration[5.0]
  def up
    add_timestamps(:reviews)
  end

  def down
    remove_timestamps(:reviews)
  end
end
