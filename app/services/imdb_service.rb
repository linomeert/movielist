class ImdbService
  def movie_info(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{title}").to_s
    parsed_response = JSON.parse(response)
  end
end
