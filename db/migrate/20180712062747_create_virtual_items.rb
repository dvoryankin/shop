class CreateVirtualItems < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_items do |t|
      t.timestamps
    end
  end
end
