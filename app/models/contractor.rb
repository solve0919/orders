class Contractor < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :images
  accepts_nested_attributes_for :images
end
