class ContentCreator < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_one_attached :profile_picture

end