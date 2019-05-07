class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :description, length: { in: 10..400 }
  def login_user?(user)
    #@contractor.user.id ==  current_user.id
    user.id == self.user.id
  end
end
