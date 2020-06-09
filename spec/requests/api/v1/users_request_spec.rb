require 'rails_helper'

RSpec.describe 'Users API' do
  it "can create a user with a unique api key" do
    email = "unique@example.com"
    password = "password"
    confirmation = "password"
    user_params = { "email": email,
                    "password": password,
                    "password_confirmation": confirmation}

    post '/api/v1/users', params: user_params

    expect(response).to be_successful
    expect(response.status).to eql(201)

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)

    expect(json[:data][:attributes][:email]).to eql(email)
    expect(json[:data][:attributes][:api_key]).to_not be_nil
  end

  it "can send back error if email already taken" do
    email = "unique@example.com"
    password = "password"
    confirmation = "password"
    user_params = { "email": email,
                    "password": password,
                    "password_confirmation": confirmation}

    post '/api/v1/users', params: user_params
    expect(response.status).to eql(201)
    post '/api/v1/users', params: user_params
    expect(response.status).to eql(422)

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to have_key(:message)
    expect(json[:data][:attributes][:message]).to eql('Email has already been taken')
  end

  it "can send back error if passwords don't match" do
    email = "unique@example.com"
    password = "password"
    confirmation = "not a match"
    user_params = { "email": email,
                    "password": password,
                    "password_confirmation": confirmation}

    post '/api/v1/users', params: user_params
    expect(response.status).to eql(422)

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to have_key(:message)
    expect(json[:data][:attributes][:message]).to eql('Password confirmation doesn\'t match Password')
  end

  it "can send back error if missing a field" do
    email = ''
    password = 'password'
    confirmation = 'password'
    user_params = { "email": email,
                    "password": password,
                    "password_confirmation": confirmation}

    post '/api/v1/users', params: user_params

    expect(response.status).to eql(422)

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to have_key(:message)
    expect(json[:data][:attributes][:message]).to eql('Email can\'t be blank')
  end
end
