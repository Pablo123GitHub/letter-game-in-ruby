require_relative("../lib/random_string.rb")

describe RandomString do   
    let(:subject) { described_class.new }

    context "output a random string with X amount of letters" do   
        it "shows one random letter stubbed as being A" do          
            allow(Kernel).to receive(:rand).and_return(0)
            expect(subject.show_random_string(1)).to eq("A")
        end 

        it "shows two random letters stubbed as being AB" do   
            allow(Kernel).to receive(:rand).and_return(0,1)
            expect(subject.show_random_string(2)).to eq("AB")
        end 
    end 

    context "output a random string with 5 letters" do   
        it "has a length of 5" do   
            allow(RandomWord).to receive(:nouns).and_call_original
            expect(subject.random_word.length).to eq(5)
        end 
        it "has a String class" do   
            allow(RandomWord).to receive(:nouns).and_call_original
            expect(subject.random_word.class).to eq(String)
        end 
    end 
end 