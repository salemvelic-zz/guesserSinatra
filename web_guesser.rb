require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER  = rand(100)
message = ""

def check_guess(guess = "") 

    if guess - 5 > SECRET_NUMBER
        message = "Way too high"
        color = "red"
        return message, color
    elsif guess > SECRET_NUMBER
        message = "Too high"
        color = "DarkRed"
        return message, color    
    elsif guess + 5 < SECRET_NUMBER
        message = "Way too low"
        color = "FireBrick"
        return message, color
    elsif guess < SECRET_NUMBER
        message = " Too low" 
        color = "IndianRed"
        return message, color   
    else 
        message = "You got it right!"
        color = "green"
        return message, color
    end    
end

get '/' do
  color = "red"
  guess = params["guess"].to_i
  message, color = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :message => message, :color => color}
end