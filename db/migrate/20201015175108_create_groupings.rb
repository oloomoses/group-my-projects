class CreateGroupings < ActiveRecord::Migration[5.2]
  def change
    create_table :groupings do |t|
      t.references :project, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
