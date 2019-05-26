class Order < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :name, :postal_code, :prefectures, :ward, :address, :phone_number, presence: true
  validates :postal_code, length: { is: 7 }
  
  def myself?(user)
    user.id == self.user.id
  end
end
