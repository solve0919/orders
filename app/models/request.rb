class Request < ApplicationRecord
  belongs_to :order
  belongs_to :contracrtor , optional: true

  enum status: {request:0,consultation:1,orders:2,work:3, shipping:4,completion:5}
end
