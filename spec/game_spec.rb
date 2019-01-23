
require 'game'

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
        it "records correct response as player's response" do   
            @game.player_response(@correct_answer)
            expect(@game.show_player_response()).to eq(@correct_answer)
        end 

        it "records wrong answer as player's response" do   
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
    context "The game gives information about the players' response" do   
        it "tells the player that all letters in response are wrong" do   
            @game.player_response("rstuv")
            player_answer = @game.show_player_response()
            expect(@game.assess_response(player_answer)).to eq("1:not correct, 2:not correct, 3:not correct, 4:not correct, 5:not correct")
        end 
        it "tells the player that one letter is correct and at the right position, but all the other ones are wrong" do   
            @game.player_response("Bstuv")
            player_answer = @game.show_player_response()
            expect(@game.assess_response(player_answer)).to eq("1:well done!, 2:not correct, 3:not correct, 4:not correct, 5:not correct")
        end 
        it "tells the player that two letters are correct/correctly placed, the other ones wrong" do   
            @game.player_response("Bsjdf")
            player_answer = @game.show_player_response()
            expect(@game.assess_response(player_answer)).to eq("1:well done!, 2:not correct, 3:not correct, 4:not correct, 5:well done!")
        end 

        context "tells the player about a letter that is part of the response but at the wrong position" do 
            it "tells the player about ONE correct letter at the wrong index" do   
                @game.player_response("zbuuu")
                player_answer = @game.show_player_response()
                expect(@game.assess_response(player_answer)).to eq("1:not correct, 2:correct letter wrong spot, 3:not correct, 4:not correct, 5:not correct")
            end 
        end 
    end 
end

