class UnsplashService
  def image_url_for(city, state)
    response = Faraday.get("https://api.unsplash.com/search/photos?client_id=XdQ1Jjt3OTrq6q3z_dHyn3_jp6NYvmJYDGzAvBVUZcg&query=denver&per_page=1")
    JSON.parse(response.body, symbolize_names: true)
  end
end
