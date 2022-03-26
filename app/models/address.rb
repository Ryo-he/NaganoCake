class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + delivery_name
  end
end
