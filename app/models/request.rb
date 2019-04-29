class Request < ApplicationRecord
  belongs_to :order
  belongs_to :contractor , optional: true
  enum status: {request:0,consultation:1,orders:2,work:3, shipping:4,completion:5}

  def can_access?(user)
    user.id == self.contractor_id ||  user.id == self.order_id
  end
end
