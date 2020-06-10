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
- /api/v1/forecast?location=<city>,<state>
  - returns weather information for the location

- /api/v1/backgrounds?location=<city>,<state>
 - returns an appropriate image from Unsplash based on location

- /api/v1/users  (creates user)
 - pass json in body of request:
 ...```
    { email: <user@example>,
      password: <value>,
      password_confirmation: <value> }
    ```

- /api/v1/sessions (returns api-key)
 - pass json in body of request:
 ...```
    { email: <user@example>,
      password: <value> }
    ```
 - returns api-key of user

- /api/v1/road_trip
 - pass json in body of request:
 ...```
    { origin: <city,state>,
      destination: <city,state>,
      api-key: <valid api-key> }
    ```
 - returns travel time and forecast of destination upon arrival.

### Database
- PostgreSQL
- `rails db:{create,migrate}` for setup

### Specs
- Testing with RSpec
- `bundle exec rspec` to run all tests
- `bundle exec rspec <filepath>` to run individual specs

### Services / API
- Google API:
 - Directions
 - Geocode
- OpenWeather API
 - OneCall
- Unsplash API
