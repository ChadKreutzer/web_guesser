require 'sinatra'
require 'sinatra/reloader'

random_number = rand(100)

get '/' do
  "THE SECRET NUMBER IS #{random_number}"
end
