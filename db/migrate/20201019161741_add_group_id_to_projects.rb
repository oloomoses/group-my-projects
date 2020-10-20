class AddGroupIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :group, foreign_key: true
  end
end
