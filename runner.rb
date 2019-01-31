
require_relative("./lib/game")
require_relative("./lib/random_string")

@game = Game.new

def prompt(*args)
    print(*args)
    gets
end

while true
    response = prompt "Input your response: "
    @game.player_response(response)
    assessment = @game.assess_response_right_or_wrong
    puts assessment
    break if @game.player_found_answer || @game.player_failed_to_find_answer
end