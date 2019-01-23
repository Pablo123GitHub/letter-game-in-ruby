require_relative('../lib/game.rb')

describe Game do

    before(:all) do 
        @correct_answer = "BACEF"
        @wrong_answer = "ABCEF"
        @game = Game.new(@correct_answer)
        @player_response1 = {
            one: "A",
            two: "B",
            three: "C",
            four: "D",
            five: "E"
        } 

        @player_response2 = {
            one: "E",
            two: "B",
            three: "C",
            four: "D",
            five: "A"
        } 
    end 
   
    context "instantiate a valid game" do  
        it "should be an instance of a Game class" do   
            expect(@game).to be_an_instance_of(Game)
        end 
        
        it "responds to one" do   
            expect(@game).to respond_to(:one)
        end 

        it "responds to two" do  
            expect(@game).to respond_to(:two)
        end 

        it "responds to three" do  
            expect(@game).to respond_to(:three)
        end 

        it "responds to four" do  
            expect(@game).to respond_to(:four)
        end 

        it "responds to five" do  
            expect(@game).to respond_to(:five)
        end 
    end 

    context "the Game class records player's response" do 
        it "records respons1 as player's response" do   
            @game.player_response(@correct_answer)
            expect(@game.show_player_response()).to eq(@correct_answer)
        end 

        it "records respons2 as player's response" do   
            @game.player_response(@wrong_answer)
            expect(@game.show_player_response()).to eq(@wrong_answer)
        end 
    end 

    context "checking if the player's response is correct or not" do   
        it "shows that the player's response is wrong " do   
            @game.player_response(@wrong_answer)
            expect(@game.player_found_answer()).to eq(false)
        end 
        it "shows that the player's response is correct" do   
            @game.player_response(@correct_answer)
            expect(@game.player_found_answer()).to eq(true)
        end 
        it "raises an error about input string length" do   
            expect { @game.player_response("h")}.to raise_error("input must be exactly 5 letters")
        end 
        it "raises an error if input is not String type" do   
            expect { @game.player_response("h£ur@")}.to raise_error("input must be letters only")
        end 
    end
end

