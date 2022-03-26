class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.string :is_active
      t.integer :amount
      t.integer :purchase
      t.timestamps
    end
  end
end
