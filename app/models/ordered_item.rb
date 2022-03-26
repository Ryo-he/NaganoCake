class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum is_active: { incomplete: 0, making: 1, complete: 2 }
end
