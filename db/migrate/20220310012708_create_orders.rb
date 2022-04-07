class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :orderd_at
      t.boolean :payment_method, default: true, null: false
      t.integer :payment_amount
      t.integer :is_active
      t.string :delivery_name
      t.integer :amount
      t.string :address
      t.integer :postage
      t.timestamps
    end
  end
end
