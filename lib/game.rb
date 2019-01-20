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

    def player_response(player_response)
        @player_response = player_response
    end 

    def player_response_as_a_string(input_string)
        check_player_input(input_string)
        player_response(hashify_string(input_string.strip))
    end

    def show_player_response
        @player_response 
    end 

    def player_found_answer
        @player_response == @correct_response
    end

    private 

    def check_player_input input_string
        raise "inpust must be exactly 5 letters" if !is_correct_length(input_string.strip)
        raise "input must be letters only" if !has_correct_format(input_string.strip)
    end 

    def hashify_string input_string
        turn_string_into_hash(input_string.strip)
    end 

    def is_correct_length input_string
        input_string.length == 5   
    end 

    def has_correct_format input_string
        input_string.match(/^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$/)
    end

    def turn_string_into_hash input_string
        new_hash = Hash.new()
        keys = [:one, :two, :three, :four, :five]
        array_keys = input_string.split("")
        array_keys.each_with_index do |el,index|
            new_hash[keys[index.to_i]] = input_string[index].upcase
        end 
        new_hash
    end 

end 