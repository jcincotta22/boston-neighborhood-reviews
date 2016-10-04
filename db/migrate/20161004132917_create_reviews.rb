class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
     t.belongs_to :user, null: false
     t.belongs_to :microhood, null: false
     t.float :rating, null: false
     t.integer :safety_rating, null: false
     t.integer :schools_rating, null: false
     t.integer :food_entertainment, null: false
     t.integer :public_transport, null: false
     t.string :title, null: false
     t.text :body, null: false

     t.timestamps
    end
  end
end
