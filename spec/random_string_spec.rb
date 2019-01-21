require_relative("../lib/random_string.rb")

describe RandomString do   
    let(:subject) { described_class.new }

    context "output a random string with X amount of letters" do   
        it "shows one random letter stubbed as being A" do          
            allow(Kernel).to receive(:rand).and_return(0)
            expect(subject.show_random_word(1)).to eq("A")
        end 

        it "shows two random letters stubbed as being AB" do   
            allow(Kernel).to receive(:rand).and_return(0,1)
            expect(subject.show_random_word(2)).to eq("AB")
        end 
    end 
end 