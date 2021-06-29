require_relative './app'

require 'test/unit'
require 'rack/test'

# :nodoc:
class UsersTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def setup
    Users.clear!
  end

  def app
    Sinatra::Application
  end

  def test_adding_users
    post '/users', { name: 'Peter' }.to_json

    assert(Users.list_all.find { |u| u[:name] == 'Peter' })
  end
  

  def test_listing_users
    post '/users', { name: 'Peter' }.to_json
    post '/users', { name: 'John' }.to_json
    post '/users', { name: 'Conway' }.to_json

    get '/users'

    assert_equal(JSON.parse(last_response.body).map { |u| u['name'] }, %w[
                   Peter
                   John
                   Conway
                 ])
  end
end
