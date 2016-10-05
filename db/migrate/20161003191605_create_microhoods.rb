class CreateMicrohoods < ActiveRecord::Migration[5.0]
  def change
    create_table :microhoods do |t|
      t.belongs_to :user, null: false
      t.belongs_to :neighborhood, null: false
      t.string :street, null: false
      t.string :zip
      t.string :description
    end
  end
end
