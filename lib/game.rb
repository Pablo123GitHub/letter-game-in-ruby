class Game 

    attr_reader :one, :two, :three, :four, :five

    def initialize(data)
        @one = data[:one]
        @two = data[:two]
        @three = data[:three]
        @four = data[:four]
        @five = data[:five]
        @player_response = nil
        @correct_response = data
    end 

    def start
        puts "Start the game"
    end

    def player_response(player_response)
        @player_response = player_response
    end 

    def show_player_response
        @player_response 
    end 

    def player_found_answer
        @player_response == @correct_response
    end 

end 