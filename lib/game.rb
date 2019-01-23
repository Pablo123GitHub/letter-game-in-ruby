class Game 

    attr_reader :one, :two, :three, :four, :five

    def initialize(data)
        @one = data[0]
        @two = data[1]
        @three = data[2]
        @four = data[3]
        @five = data[4]
        @player_response = nil
        @correct_response = data
    end

    def player_response(player_response)
        check_player_input(player_response)
        @player_response = player_response.strip
    end 

    def show_player_response
        @player_response 
    end 

    def player_found_answer
        @player_response == @correct_response
    end

    private 

    def set_initial_string_as_hash(input_string)
        check_player_input(input_string)
        hashify_string(input_string.strip)
    end 

    def check_player_input input_string
        raise "input must be exactly 5 letters" if !is_correct_length(input_string.strip)
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
            new_hash[keys[index.to_i]] = input_string[index.to_i].upcase
        end 
        new_hash
    end
end 