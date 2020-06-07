class UnsplashService
  def image_url_for(city, state)
    hashed_json(photo_response(city, state))
  end

  private

  def base_url
    'https://api.unsplash.com'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['client_id'] = ENV['UNSPLASH_KEY']
    end
  end

  def photo_response(city, state)
    connect.get('search/photos') do |req|
      req.params['query'] = "#{city} #{state}"
      req.params['per_page'] = '1'
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
