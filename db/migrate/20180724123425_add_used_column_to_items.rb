class AddUsedColumnToItems < ActiveRecord::Migration[5.2]
  def up
    add_column :items, :used, :boolean, default: false
  end

  def down
    remove_column :items, :used
  end
end
