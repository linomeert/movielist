require "http"
require 'uri'

class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_movies, only: [:index]

  def index
  end

  def new
    @movielist = MovieList.find(params[:movie_list_id])
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.name = params["movie"]["name"]
    @movie_info = movie_info(@movie.name)

    @movie.year = @movie_info["Year"]
    @movie.director = @movie_info["Director"]
    @movie.cast = @movie_info["Actors"]
    @movie.imdb_rating = @movie_info["imdbRating"]
    @movie.image = @movie_info["Poster"]
    @movie.genre = @movie_info["Genre"]
    @movie.imdb_link = @movie_info["imdbID"]

    @movielist = MovieList.find(params[:movie_list_id])
    @movielist.movies << @movie

    if @movie.save
      redirect_to movie_list_path(params["movie_list_id"])
    else
      render :new
    end
  end

  def movie_info(title)
    newtitle = CGI.escape(title)
    link = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&t=#{newtitle}"
    response = HTTP.get(link)
    parsed_response = JSON.parse(response)
  end

  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movies
    @movies = Movie.all
  end

  def movie_params
    params.require(:movie).permit(:name, :year, :director, :cast, :imdb_rating, :imdb_link, :genre, :watched)
  end
end
