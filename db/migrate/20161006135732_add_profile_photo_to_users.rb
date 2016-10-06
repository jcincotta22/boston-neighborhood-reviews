class AddProfilePhotoToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :profile_photo, :string
  end

  def down
    remove_column :users, :profile_photo
  end
end
