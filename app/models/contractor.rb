class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :description, length: { in: 10..400 }
end
