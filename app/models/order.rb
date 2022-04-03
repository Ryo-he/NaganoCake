class Order < ApplicationRecord
  belongs_to :orders
  has_many :ordered_items
  has_many :addresses
  enum payment_method: { creditcard: 0, transfer: 1 }
  enum address: { current_address: 0, registered_address: 1, new_address: 2}
  
end
