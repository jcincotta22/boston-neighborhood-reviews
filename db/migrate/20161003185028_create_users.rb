class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :profile_pic_url, null: false
    end
  end
end
