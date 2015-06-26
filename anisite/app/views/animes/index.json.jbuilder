json.array!(@animes) do |anime|
  json.extract! anime, :id, :title, :year, :number_of_episodes
  json.url anime_url(anime, format: :json)
end
