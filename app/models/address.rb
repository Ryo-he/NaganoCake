class Address < ApplicationRecord
 belongs_to :customer
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + delivery_name
  end
end
