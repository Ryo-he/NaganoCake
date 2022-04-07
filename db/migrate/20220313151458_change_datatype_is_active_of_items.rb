class ChangeDatatypeIsActiveOfItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :is_active, :boolean, default: true, null: false
  end
end
