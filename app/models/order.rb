class Order < ApplicationRecord
  has_many :ordered_items
  belongs_to :customer
end
