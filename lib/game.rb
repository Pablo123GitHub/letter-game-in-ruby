require_relative './random_string'

require 'byebug'

class Game 

    def initialize(data = nil)
        data = data || RandomString.new.show_random_word(5)
        @player_response = nil
        @correct_response = data.upcase
        @response_hash = {
            0 => data[0],
            1  => data[1],
            2  => data[2],
            3  => data[3],
            4  => data[4]
        }
    end

    def player_response(player_response)
        check_player_input(player_response)
        @player_response = player_response.strip.upcase
    end 

    def show_player_response
        @player_response 
    end 

    def player_found_answer
        @player_response.strip.upcase == @correct_response.strip.upcase
    end

    def assess_response_right_or_wrong ()
        hash_wrong_values = Hash.new 
        hash_found_values = Hash.new 
        array_outstanding_values_to_find = Array.new 
        assessment = Array.new       
        array_hashes_user_input = turn_string_into_arr_with_hashes(@player_response)
        array_hashes_user_input.each_with_index do  |hash, index|
            hash_letter = hash[index]
            if hash_letter == @response_hash[index].upcase
                assessment.push("#{index.to_i + 1 }:well done!")
                hash_found_values[index.to_i] = hash_letter
            else  
                assessment.push("#{index.to_i + 1 }:not correct")    
                array_outstanding_values_to_find.push(hash_letter)
                hash_wrong_values[index.to_i] = hash_letter
            end 
        end 
      
        assessment = find_misplaced_letters(assessment, hash_wrong_values)

        assessment.join(", ")
    end 

    private 

    def find_misplaced_letters(arr_input_assessment, hash_wrong_values)
        array_correct_response = @correct_response.split("")
       

        array_correct_response.each_with_index { |letter, index|
            if arr_input_assessment[index].include? "well done"
                array_correct_response[index] = nil
            end 
        }
      
    
        hash_wrong_values.each do  | key, value|
        if array_correct_response.include? value
            arr_input_assessment[key.to_i] = "#{key.to_i + 1 }:correct letter wrong spot"
            array_correct_response[array_correct_response.index(value)] = nil 
        end 
        end 
        arr_input_assessment
    end 
    

    def turn_string_into_arr_with_hashes string_input 
        arr_correct_value = string_input.split("")
 
        arr_with_hashes = Array.new
         arr_correct_value.each_with_index do |letter, index| 
            hash_correct = Hash.new 
            hash_correct[index.to_i]= letter.upcase
            arr_with_hashes.push(hash_correct)
        end 
        arr_with_hashes
    end 

    def totals(input_array_of_hashes)
        input_array_of_hashes.reduce({}) do |sums, location|
      sums.merge(location) { |_, a, b| a + b }
        end
    end 

    def is_included_but_wrong_spot (char)
        @correct_response.include? char 
    end 

    def has_not_same_index_as_correct_response(input_char)
        all_indexes_of_char_in_word(input_char, @correct_response)
        all_indexes_of_char_in_word(input_char, @player_response)
    end 

    def all_indexes_of_char_in_word (input_char, inputr_string)
        indexes_same_char = Array.new 
        inputr_string.each_char.with_index do |char, index|
            indexes_same_char.push(index) if input_char == inputr_string[index]
        end 
        indexes_same_char
    end 

    def check_player_input input_string
        raise "input must be exactly 5 letters" if !is_correct_length(input_string.strip)
        raise "input must be letters only" if !has_correct_format(input_string.strip)
    end 

    def is_correct_length input_string
        input_string.length == 5   
    end 

    def has_correct_format input_string
        input_string.match(/^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$/)
    end

    def set_string_as_hash(input_string)
        check_player_input(input_string)
        hashify_string(input_string.strip)
    end 

    def hashify_string input_string
        turn_string_into_hash(input_string.strip)
    end 

    def turn_string_into_hash_old input_string
        new_hash = Hash.new()
        keys = [:one, :two, :three, :four, :five]
        array_keys = input_string.split("")
        array_keys.each_with_index do |el,index|
            new_hash[keys[index.to_i]] = input_string[index.to_i].upcase
        end 
        new_hash
    end
end