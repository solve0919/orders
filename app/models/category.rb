class Category < ApplicationRecord
  has_many :contractor_category
  has_many :contractor, through: :contractor_category
end
