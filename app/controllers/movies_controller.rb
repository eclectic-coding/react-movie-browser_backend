class MoviesController < ApplicationController
  before_action :authorized, except: %i[index show]

  include MoviesHelper

  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    loc_movie = @movie.movie_id
    movie_detail(loc_movie)
    render json: @movie
  end

  def votes
    @movies = Movie.all.average_vote
  end

  def title
    @movies = Movie.all.title
  end
  
end
