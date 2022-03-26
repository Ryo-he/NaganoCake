class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :addresses
  has_many :cart_items
  enum is_active: { validity:0, withdrawal:1 }
  def active_for_authentication?
    super && (is_active == false)
  end
end
