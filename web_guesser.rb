require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, locals: { number: settings.number, message: message }
end

def check_guess(guess)
  guess = guess.to_i
  if guess == settings.number
    return "You got it right! The number was #{settings.number}"
  end
  guess > settings.number ? too_high(guess) : too_low(guess)
end

def too_high(guess)
  guess > settings.number + 5 ? 'Way too high!' : 'Too high!'
end

def too_low(guess)
  guess < settings.number - 5 ? 'Way too low!' : 'Too low!'
end
