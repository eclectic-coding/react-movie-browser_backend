class WatchlistsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :movie_id
end
