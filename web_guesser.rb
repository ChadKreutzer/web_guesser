require 'sinatra'
require 'sinatra/reloader'

set :number => rand(100), :color => 'red'

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, locals: { number: settings.number, message: message, color: settings.color }
end

def check_guess(guess)
  guess = guess.to_i
  if guess == settings.number
    settings.color = 'green'
    return "You got it right! The number was #{settings.number}"
  end
  guess > settings.number ? too_high(guess) : too_low(guess)
end

def too_high(guess)
  if guess > settings.number + 5
    way_off_color
    'Way too high!'
  else
    off_color
    'Too high!'
  end
end

def too_low(guess)
  if guess < settings.number - 5
    way_off_color
    'Way too low!'
  else
    off_color
    'Too low!'
  end
end

def way_off_color
  settings.color = 'red'
end

def off_color
  settings.color = 'pink'
end
