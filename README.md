# Sweater Weather
### Ruby Version
2.5.3

### Description
Sweater is a Rails base API service. It provides information to an imaginary front end team across many endpoints.

### Heroku URL / Online Base URL for API
https://sweater-weather-api-rc.herokuapp.com/

### Running Locally
- `git clone git@github.com:cmpprg/sweater_weather_api.git`
- run `bundle install`,

### Endpoints
- __/api/v1/forecast?location=_city_,_state___
  - returns weather information for the location

- __/api/v1/backgrounds?location=_city_,_state___
  - returns an appropriate image from Unsplash based on location

- __/api/v1/users__
  - pass json in body of request:  
... ```
    { email: _user@example_,
      password: _value_,
       password_confirmation: _value_ }
    ```
 - creates users and returns information including email and api-key
- __/api/v1/sessions (returns api-key)__
 - pass json in body of request:  
 ...```
    { email: _user@example_,
      password: _value_ }
    ```
 - returns api-key of user

- __/api/v1/road_trip__
 - pass json in body of request:  
 ...```
    { origin: _city,state_,
      destination: _city,state_,
      api-key: _valid api-key_ }
    ```
 - returns travel time and forecast of destination upon arrival.

### Database
- PostgreSQL
- `rails db:{create,migrate}` for setup

### Specs
- Testing with RSpec
- `bundle exec rspec` to run all tests
- `bundle exec rspec _filepath_` to run individual specs

### Services / API
- Google API:
 - Directions
 - Geocode
- OpenWeather API
 - OneCall
- Unsplash API
