require_relative('../lib/game.rb')

describe Game do

    before(:all) do 
        @game = Game.new({one: "B", two: "A", three: "C", four: "E", five: "F"})
    end 
   
    context "instantiate a valid game" do   
        it "responds to one" do   
            expect(@game).to respond_to(:one)
        end 

        it "responds to two" do  
            expect(@game).to respond_to(:two)
        end 

        it "responds to two" do  
            expect(@game).to respond_to(:three)
        end 

        it "responds to two" do  
            expect(@game).to respond_to(:four)
        end 

        it "responds to two" do  
            expect(@game).to respond_to(:five)
        end 
    end 

    it "prompts the player to start the game" do   
        expect { @game.start() }.to output("Start the game\n").to_stdout  
      end 

end

