class Address < ApplicationRecord
 belongs_to :customer
  def full_address
    '〒' + postal_code + ' ' + resident + ' ' + name
  end
end
