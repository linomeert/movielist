class MovieListsController < ApplicationController
  before_action :set_movielist, only: [:show, :edit, :update, :destroy, :invite_user]
  before_action :set_movielists, only: [:index]

  def index
  end

  def new
    @movielist = MovieList.new
    @admin = current_user
  end

  def create
    @movielist = MovieList.new(movielist_params)
    @movielist.admin = current_user
    current_user.movie_lists << @movielist


    if @movielist.save
      redirect_to movie_lists_path
    else
      render :new
    end
  end

  def show
  end

  def invite_user
    @user = User.search(params[:search])

  end

  private

  def set_movielist
    @movielist = MovieList.find(params[:id])
  end

  def set_movielists
    @allmovielists = MovieList.all
    @movielists = []
    @allmovielists.each do |movielist|
      @movielists << movielist if movielist.users.include? current_user
    end
  end

  def movielist_params
    params.require(:movie_list).permit(:name)
  end
end
