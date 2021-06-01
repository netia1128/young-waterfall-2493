# app/controllers/movie_controller.rb

class MoviesController < ApplicationController

  def create
    Movie.create(movie_params)
    redirect_to '/movies'
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to '/movies'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
  end

  def new
  end

  def show
  @movie = Movie.find(params[:id])
  @actors = @movie.actors
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie)
    movie.save

    redirect_to action: 'show', id: params[:id]
  end

  private

  def movie_params
    params.permit()#add params here in :name, :age format)
  end
end