class Order < ApplicationRecord
  has_many :ordered_items
  belongs_to :customer
  enum payment_method: { creditcard: 0, transfer: 1 }
end
