class ChangeDatatypeIsActiveOfAddIsActiveToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :is_active, :string
  end
end
