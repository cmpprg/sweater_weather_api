module HelperMethods
  def hash_json(response_body)
    JSON.parse(response_body, symbolize_names: true)
  end

  def create_user(email, password, password_confirmation = password)
    User.create({
      email: email,
      password: password,
      password_confirmation: password_confirmation
      })
  end
end
