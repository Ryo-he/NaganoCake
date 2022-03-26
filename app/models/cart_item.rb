class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  belongs_to :order
  belongs_to :ordered_item
  def subtotal
    item.add_tax_price*amount
  end
end
