class UsersController < ApplicationController
  def index

  end

  def search
    @user = User.search(params[:search])
  end

  def show
    @users = User.search(params[:search])
    @movielist = MovieList.find(params[:format])
  end

  def invite
    @user = User.find(params[:user_id])
    @movielist = MovieList.find(params[:movielist_id])
    if @movielist.users.include? @user
      redirect_to :movie_lists
      inspect
    else
      @movielist.users << @user
      redirect_to :movie_lists
    end
  end
end
