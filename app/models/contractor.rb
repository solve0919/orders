class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :description, length: { in: 10..400 }
  def myself?(user)
    #@current_user.id == contractor.user.id 
    user.id == self.user.id
  end
end
