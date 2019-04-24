class Request < ApplicationRecord
  belongs_to :order
  belongs_to :contracrtor , optional: true
end
