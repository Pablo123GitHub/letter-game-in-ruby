
require_relative("./lib/game")
require_relative("./lib/random_string")

@correct_answer = "abcde"

@game = Game.new(@correct_answer)

def prompt(*args)
    print(*args)
    gets
end

response = prompt "Input your response: "
puts "your response is "
puts response

@game.player_response(response)

if @game.player_found_answer
    puts "you got the CORRECT answer"
else 
    puts "WRONG answer, try again" 
end 

