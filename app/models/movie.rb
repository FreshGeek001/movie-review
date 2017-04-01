class Movie < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :posts
end
