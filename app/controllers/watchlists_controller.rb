class WatchlistsController < ApplicationController
  before_action :authorized, except: %i[index create show]
  include MoviesHelper

  def index
    @watchlists = Watchlist.all
    render json: @watchlists
  end

  def show
    @watchlist = Watchlist.where(user_id: current_user)
  end

  def create
    @watchlist = Watchlist.create(watch_list_params)
    if @watchlist.valid?
      render json: { user: WatchlistsSerializer.new(@watchlist) }, status: :created
    else
      render json: { error: 'failed to create watchlist' }, status: :not_acceptable
    end
  end

  private

  def watch_list_params
    params.require(:watchlists).permit(
      :user_id,
      :movie_id
    )
  end
end
