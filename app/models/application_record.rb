class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def myself?(user)
    user.id == self.user.id
  end
end
