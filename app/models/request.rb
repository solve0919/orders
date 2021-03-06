class Request < ApplicationRecord
  belongs_to :order
  belongs_to :contractor , optional: true
  enum status: { request:0, consultation:1, orders:2, work:3, shipping:4 ,completion:5}
  enum delivery: { japan_post:0, yamato:1, sagawa:2}

  def can_access?(user)
    user.id == self.contractor.user_id ||  user.id == self.order.user_id
  end

  def contractor?(user)
    user.id == self.contractor.id
  end
  
  def order?(user)
    user.id == self.order.id
  end

  def case_status?(user)
    self.completion! if self.shipping?
    self.shipping! if self.work?
    self.work! if self.orders?

    if self.consultation?
      if self.order.user_id == user.id
        self.judge_order = true
        self.save!
      end
      if self.contractor.user_id == user.id
        self.judge_contractor = true
        self.save!
      end
      if self.judge_contractor && self.judge_order 
        self.orders!
      end
    end

    self.consultation! if self.request?
  end
end
