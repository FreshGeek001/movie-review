class MoviesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy,:favorite,:unfavorite]
  before_action :find_group_and_check_permission, only: [:edit,:update,:destroy]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @posts = @movie.posts
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to movies_path, notice:"Movie Created"
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy

    @movie.destroy
    redirect_to movies_path, alert:"Movie Deleted"
  end

  def favorite
    @movie = Movie.find(params[:id])
    current_user.favorite_movies << @movie
    redirect_to :back
  end

  def unfavorite
    @movie = Movie.find(params[:id])
    current_user.favorite_movies.delete(@movie)
    redirect_to :back
  end

  private

  def find_group_and_check_permission
    @movie = Movie.find(params[:id])

    if current_user != @movie.user
      redirect_to root_path, alert:"You have no permission"
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :image)
  end
end
