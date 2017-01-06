require 'sinatra'
require 'sinatra/reloader'

set number: rand(100), color: 'red'
@@count = 6

get '/' do
  @@count -= 1
  guess = params['guess']
  message = @@count == 0 ? lost_game : check_guess(guess)
  erb :index, locals: { number: settings.number,
                        message: message,
                        color: settings.color }
end

def check_guess(guess)
  guess = guess.to_i
  if guess == settings.number
    return correct_guess
  end
  guess > settings.number ? too_high(guess) : too_low(guess)
end

def correct_guess
  settings.color = 'green'
  "You got it right! #{end_game}"
end

def too_high(guess)
  if guess > settings.number + 5
    way_off_color
    "Way too high! #{@@count}"
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

def lost_game
  "sorry, you took too long. #{end_game}"
end

def end_game
  current_number = settings.number
  settings.number = rand(100)
  @@count = 6
  "The number was #{current_number}\n refresh to start a new game!"
end
