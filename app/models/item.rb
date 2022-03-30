class Item < ApplicationRecord
  belongs_to :genre
 
  has_many :ordered_items
  has_many :cart_items
  has_one_attached :image
  enum is_active: { sale: 0, stop_saling: 1 }

def add_tax_price
    (price*1.10).floor
end
end
