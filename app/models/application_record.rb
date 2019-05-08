class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def myself?(user)
    #current_user.id == contractor.user.id 
    #current_user.id == "@request".contractor.user_id
    user.id == self.user.id
  end
end
