class WatchlistsController < ApplicationController
  before_action :authorized, except: %i[index show]
  include MoviesHelper

  def index
    @user_list = Watchlist.where(user_id: current_user)
    render json: @user_list
  end

  def show

  end

  def create

  end
end
