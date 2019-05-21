class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :contractor_categories
  has_many :categories, through: :contractor_categories
  accepts_nested_attributes_for :contractor_categories

  validates :description, length: { in: 10..400 }
end
