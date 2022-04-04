class Order < ApplicationRecord
  has_many :ordered_items
  enum payment_method: { creditcard: 0, transfer: 1 }
end
