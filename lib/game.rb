class Game 

    attr_reader :one, :two, :three, :four, :five

    def initialize(data)
        @one = data[:one]
        @two = data[:two]
        @three = data[:three]
        @four = data[:four]
        @five = data[:five]
        @player_response = nil
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
        @player_response == {
            one: @one,
            two: @two,
            three: @three,
            four: @four,
            five: @five,
        }
    end 



end 