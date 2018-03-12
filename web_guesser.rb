require 'sinatra'
require 'sinatra/reloader'


class Player

  @@track = 5 
  @@secret_number = rand(100)

  def random_number
    @@secret_number
  end

  def check_guess(guess = "") 

      if @@track  == 0 and guess == @@secret_number
          @@track = 5
          @@secret_number = rand(100)
          return "You won! New number is generated","blue"
      elsif @@track == 0
          @@track = 5
          @@secret_number = rand(100)
          return "You lost! New number is generated","orange"
      else
          @@track -= 1
          if guess - 5 >  @@secret_number
              message = "Way too high"
              color = "red"
              return message, color
          elsif guess >  @@secret_number
              message = "Too high"
              color = "DarkRed"
              return message, color    
          elsif guess + 5 <  @@secret_number
              message = "Way too low"
              color = "FireBrick"
              return message, color
          elsif guess <  @@secret_number
              message = " Too low" 
              color = "IndianRed"
              return message, color   
          else 
              message = "You got it right! New number is generated"
              color = "green"
              @@track = 5
              @@secret_number = rand(100)
              return message, color
          end  
      end  
  end
end

get '/' do
  player = Player.new
  color = "red"
  guess = params["guess"].to_i
  message, color = player.check_guess(guess)
  erb :index, :locals => { :number => player.random_number(), :message => message, :color => color}
end