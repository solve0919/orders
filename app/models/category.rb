class Category < ApplicationRecord
  has_many :contractor_category
  has_many :contractor
  enum name: {
    beer:0 ,
    alcohol:1 ,
    drinking:2 ,
    clothing:3 ,
    accessories:4 ,
    foods:5 ,
    other:6 ,
  }
end
