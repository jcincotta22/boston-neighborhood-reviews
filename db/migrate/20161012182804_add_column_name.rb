class AddColumnName < ActiveRecord::Migration[5.0]
  def up
    add_column :microhoods, :name, :string, null: false
  end

  def down
    remove_column :microhoods, :name
  end
end
