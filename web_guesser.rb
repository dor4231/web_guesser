require 'sinatra'
require 'sinatra/reloader'

$secret_number = rand(101)
$massage = "First"
$color = "darkgray"
@@life = 6
$cheat = "none"

get "/" do
    guess = params["guess"]
    if params["cheat"] == "true"
        $cheat = "block"
    else
        $cheat = "none"
    end
    $massage = check_guess(guess)
    erb :index, :locals => {:number => $secret_number, 
                            :massage => $massage,
                            :color => $color,
                            :cheat => $cheat}
end


def check_guess (number)
    if number == ""
        $color = "darkgray"
        return "First"
    elsif params["guess"].to_i - $secret_number.to_i > 5
        add = life_check()
        return "Your guess is WEY TOO HIGH! " + add
    elsif params["guess"].to_i - $secret_number.to_i < -5
        add = life_check()
        return "Your guess is WEY TOO LOW! " + add
    elsif params["guess"].to_i > $secret_number.to_i
        $color = "lightblue"
        add = life_check()
        return "Your guess is TOO HIGH! " + add
    elsif params["guess"].to_i < $secret_number.to_i
        $color = "lightblue"
        add = life_check()
        return "Your guess is TOO LOW! " + add
    else
        $color = "green"
        $secret_number = rand(101)
        @@life = 6
        return "You are CORRECT! Press the 'Guess!' botton to generate another number."
    end
end

def life_check ()
    @@life -= 1
    if @@life > 0
        return @@life.to_s + " guess left!"
    else
        $secret_number = rand(101)
        @@life = 6
        $color = "darkgray"
        return "No more guess left! Generating another number..."
    end
end
