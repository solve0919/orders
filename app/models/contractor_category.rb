class ContractorCategory < ApplicationRecord
  has_many :category
  has_many :contractor
end
