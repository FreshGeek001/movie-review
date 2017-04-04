class FavoritesController < ApplicationController
  def index
    @movies = current_user.favorite_movies
  end
end
