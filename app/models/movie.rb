class Movie < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user
end
