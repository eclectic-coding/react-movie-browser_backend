# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Seed 20 movies
movie_api = Rails.application.credentials.dig(:development, :movie_api)

n = 1
while n < 501
  movie_seed = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{movie_api}&page=#{n}"))
  movie_seed['results'].each do |movie|
    Movie.create(
      movie_id: movie['id'],
      title: movie['title'],
      release_date: movie['release_date'],
      poster_path: movie['poster_path'],
      backdrop_path: movie['backdrop_path'],
      overview: movie['overview'],
      average_vote: movie['vote_average'],
      popularity: movie['popularity'],
      budget: movie['budget'],
      tagline: movie['tagline'],
      runtime: movie['runtime'],
      genre_ids: movie['genre_ids']
    )
  end
  n += 1
end

