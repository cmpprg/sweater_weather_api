class BackgroundImage
  attr_reader :city,
              :state,
              :url

  def initialize(location)
    @city = location[:city]
    @state = location[:state]
    @url = filter_raw_url
  end

  private

  def unsplash_service
    UnsplashService.new
  end

  def image_info(city, state)
    unsplash_service.image_url_for(city, state)
  end

  def filter_raw_url
    image_info(@city, @state)[:results].first[:urls][:raw]
  end
end
