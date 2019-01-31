require('random-word')

class RandomString
    def show_random_string (input_number)
        alphabet = build_alphabet()
        response = ""
        input_number.times do  
            number = Kernel.rand(26) 
            letter = alphabet[number]
            response = response + letter
        end 
        response 
    end

    def random_word
        RandomWord.nouns(not_shorter_than: 5, not_longer_than: 5).next
    end 

    private

    def build_alphabet
        ("A".."Z").to_a
    end 

end 