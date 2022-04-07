class ChangeDatatypePaymentMethodOfOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :payment_method, :boolean, default: true, null: false
  end
end
