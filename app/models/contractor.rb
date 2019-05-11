class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  belongs_to :contractor_category
  validates :description, length: { in: 10..400 }
end
