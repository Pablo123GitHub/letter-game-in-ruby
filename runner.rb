
require_relative("./lib/game")
# require_relative("./lib/random_string")

@correct_answer = "bacef"

@game = Game.new(@correct_answer)

hey = "whatever"

def prompt(*args)
    print(*args)
    gets
end


while true
    response = prompt "Input your response: "
    @game.player_response(response)
    assessment = @game.assess_response_right_or_wrong
    puts assessment
    if @game.player_found_answer
        break
    end 
end