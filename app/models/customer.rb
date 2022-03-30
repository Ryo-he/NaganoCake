class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :addresses
  has_many :cart_items
  enum is_active: { validity: true, withdrawal: false }
  def active_for_authentication?
     super && (is_active == "validity")
  end
end
