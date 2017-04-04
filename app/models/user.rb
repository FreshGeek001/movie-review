class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies
  has_many :posts
  has_many :favorites
  has_many :favorite_movies, :through => :favorites, :source => :movie
  def is_fan_of?(group)
    favorite_movies.include?(group)
  end
end
