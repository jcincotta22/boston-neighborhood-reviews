class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value, null: false, default: 0
      t.belongs_to :review, null: false
      t.belongs_to :user, null: false
    end
  end
end
