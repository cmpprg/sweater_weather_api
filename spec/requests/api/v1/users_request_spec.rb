require 'rails_helper'

RSpec.describe 'Users API' do
  it "can create a user with a unique api key" do
    user_params = { "email": "unique@example.com",
                    "password": "password",
                    "password_confirmation": "password" }

    post '/api/v1/users', params: user_params

    expect(response).to be_successful
    expect(response.status).to eql(201)

    json = hash_json(response.body)

require 'pry'; binding.pry
  end
end
