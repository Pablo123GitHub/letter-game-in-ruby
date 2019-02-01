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
        random_word = RandomWord.nouns(not_shorter_than: 5, not_longer_than: 5).next
        while !(has_correct_format random_word)
            random_word = RandomWord.nouns(not_shorter_than: 5, not_longer_than: 5).next
        end 
        random_word
    end 

    private

    def has_correct_format input_string
        input_string.match(/^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$/)    
    end 

    def build_alphabet
        ("A".."Z").to_a
    end 

end 