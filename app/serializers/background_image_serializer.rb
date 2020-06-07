class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { |id| id = "unsplash image" }

  attributes :city, :state, :url

end
