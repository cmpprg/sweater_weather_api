module HelperMethods
  def hash_json(response_body)
    JSON.parse(response_body, symbolize_names: true)
  end
end
