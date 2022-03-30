class Address < ApplicationRecord

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + delivery_name
  end
end
