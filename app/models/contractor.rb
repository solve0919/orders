class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :contractor_category
  has_many :category, through: :contractor_category
  accepts_nested_attributes_for :contractor_category
  
  validates :description, length: { in: 10..400 }
end
