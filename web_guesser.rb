require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
massage = ""

get "/" do
    erb :index, :locals => {:number => SECRET_NUMBER, :massage => massage}
    massage = check_guess(params["guess"].to_i)
    erb :index, :locals => {:number => SECRET_NUMBER, :massage => massage}
end


def check_guess (number)
    if params["guess"].to_i - SECRET_NUMBER.to_i > 5
        return "Your guess is WEY TOO HIGH!"
    elsif params["guess"].to_i - SECRET_NUMBER.to_i < -5
        return "Your guess is WEY TOO LOW!"
    elsif params["guess"].to_i > SECRET_NUMBER.to_i
        return "Your guess is TOO HIGH!"
    elsif params["guess"].to_i < SECRET_NUMBER.to_i
        return "Your guess is TOO LOW!"
    else
        return "You are CORRECT!"
    end

end
