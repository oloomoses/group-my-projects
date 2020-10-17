class AddIndexToGroups < ActiveRecord::Migration[5.2]
  def change
    add_index :groups, :name, unique: true
  end
end
