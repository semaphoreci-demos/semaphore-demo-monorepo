require 'sinatra'

#
# A simple account registration service.
#
# It keeps users in-memory. In the real world, this would be written
# into a database.
#

require 'json'
require_relative './models'

Users.init

get '/users' do
  Users.list_all.to_json
end

post '/users' do
  user = JSON.parse(request.body.read)

  Users.add(user['name'])
end
