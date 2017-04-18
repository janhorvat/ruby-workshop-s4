class Cat < ApplicationRecord
  mount_uploader :picture, CatPictureUploader

  validates :picture, presence: true
  validates :name, presence: true
end
