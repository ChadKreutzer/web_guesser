require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  message = check_guess(params['guess'].to_i)
  erb :index, locals: { number: settings.number, message: message }
end

def check_guess(guess)
  if guess == settings.number
    return "You got it right! The number was #{settings.number}"
  end
  if guess > settings.number
    too_high(guess)
  else
    too_low(guess)
  end
end

def too_high(guess)
  if guess > settings.number + 5
    'Way too high!'
  else
    'Too high!'
  end
end

def too_low(guess)
  if guess < settings.number - 5
    'Way too low!'
  else
    'Too low!'
  end
end
