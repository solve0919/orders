class Image < ApplicationRecord
  belongs_to :order , optional: true
  belongs_to :contractor , optional: true
  mount_uploader :image, ImageUploader
end
