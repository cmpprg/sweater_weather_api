require "rails_helper"

RSpec.describe 'Sessions API' do
  before(:each) do
    @headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    user_params = {
      email: "email@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: user_params.to_json, headers: @headers
    expect(response).to be_successful
  end

  it "can return user email and api-key after authentication" do
    session_params = {
      email: "email@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params:session_params.to_json, headers: @headers

    expect(response).to be_successful

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to have_keys(:email)
    expect(json[:data][:attributes]).to have_keys(:api_key)

    expect(json[:data][:attributes][:email]).to eql(session_params[:email])
    expect(json[:data][:attributes][:api_key]).to_not be_nil
  end
end
