class RandomString
    def show_random_word (input_number)
        alphabet = build_alphabet()
        response = ""
        input_number.times do  
            number = Kernel.rand(26) 
            letter = alphabet[number]
            response = response + letter
        end 
        response 
    end 

    private

    def build_alphabet
        ("A".."Z").to_a
    end 

end 