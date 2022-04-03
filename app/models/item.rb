class Item < ApplicationRecord
  belongs_to :genre

  has_many :ordered_items
  has_many :cart_items
  has_one_attached :image

def add_tax_price
    (price*1.10).floor
end
end
