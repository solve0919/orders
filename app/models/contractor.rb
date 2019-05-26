class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :description, length: { in: 10..400 }

  def myself?(user)
    user.id == self.user.id
  end
end
