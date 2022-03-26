class Home < ApplicationRecord
    has_many :orders
    has_many :items
    has_one_attached :image
end
