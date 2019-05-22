class ContractorCategory < ApplicationRecord
  belongs_to :category
  belongs_to :contractor
end
