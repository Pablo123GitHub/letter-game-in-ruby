
require 'game'

describe Game do

    before(:all) do 
        @correct_answer = "BACEF"
        @wrong_answer = "ABCEF"
        @game = Game.new(@correct_answer)
    end 


    context 'when using the random string generator option' do
        it 'does call the random generator class' do
            expect(RandomString).to receive(:new).and_call_original
            
            Game.new
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
            expect(@game.player_found_answer).to eq(false)
        end 
        it "shows that the player's response is correct" do   
            @game.player_response(@correct_answer)
            expect(@game.player_found_answer).to eq true
        end 
        it "correct response is given in lower case, it still works : player finds an answer" do   
            correct_answer = "BACEF"
            @game.player_response(correct_answer)
            expect(@game.player_found_answer).to eq true
        end 
        it "correct response is given in mixed cases" do   
            @game.player_response(@correct_answer)
            expect(@game.player_found_answer).to eq true
        end 
        it "raises an error about input string length" do   
            expect { @game.player_response("h")}.to raise_error("input must be exactly 5 letters")
        end 
        it "raises an error if input is not String type" do   
            expect { @game.player_response("h£ur@")}.to raise_error("input must be letters only")
        end 
    end
            context "The game gives information about the player's input" do   
        
            it "tells the player that one letter is correct and at the right position, but all the other ones are wrong" do   
                @game.player_response("Bstuv")
                expect(@game.assess_response_right_or_wrong).to eq("1:well done!, 2:not correct, 3:not correct, 4:not correct, 5:not correct")
            end 
            it "tells the player that two letters are correct/correctly placed, the other ones wrong" do   
                @game.player_response("Bsjdf")
                expect(@game.assess_response_right_or_wrong).to eq("1:well done!, 2:not correct, 3:not correct, 4:not correct, 5:well done!")
            end 
    

            context "tells the player about a letter that is part of the response but at the wrong position" do 
            it "tells the player about ONE correct letter at the wrong index" do   
                @game.player_response("zbuuu") #correct BACEF
                expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:correct letter wrong spot, 3:not correct, 4:not correct, 5:not correct")
            end
            it "tells the player about TWO correct letters at the wrong index" do   
                @game.player_response("zbufu")
                expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:correct letter wrong spot, 3:not correct, 4:correct letter wrong spot, 5:not correct")
            end 
            it "tells about ONE correct letter at wrong index but ignores the other one because it is ALSO placed at the right index(f)" do   
                @game.player_response("zbuff")
                expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:correct letter wrong spot, 3:not correct, 4:not correct, 5:well done!")
            end 

            it "tells about TWO consecutive letters incorrectly placed in player's input" do    
                @game.player_response("cfcff")
                expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:not correct, 3:well done!, 4:not correct, 5:well done!")
            end 

            it "only first Letter is correct" do    
                @game.player_response("cfcff")
                expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:not correct, 3:well done!, 4:not correct, 5:well done!")
            end 
        
            context "edge cases" do   
                it "all the letters are the same and one of them is part of the correct response" do   
                    @game.player_response("fffff")
                    expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:not correct, 3:not correct, 4:not correct, 5:well done!")
                end 
                it "all the letters not placed at the right index but all of them are part of the response" do   
                    @game.player_response("abefc")

                    expect(@game.assess_response_right_or_wrong).to eq("1:correct letter wrong spot, 2:correct letter wrong spot, 3:correct letter wrong spot, 4:correct letter wrong spot, 5:correct letter wrong spot")
                end 
                it "all the letters not placed at the right index but all of them are part of the response" do   
                    @game.player_response("cbaef")
                    expect(@game.assess_response_right_or_wrong).to eq("1:correct letter wrong spot, 2:correct letter wrong spot, 3:correct letter wrong spot, 4:well done!, 5:well done!")
                end 

                it "all the letters are not in the correct response" do   
                    @game.player_response("rstuv")
                    expect(@game.assess_response_right_or_wrong).to eq("1:not correct, 2:not correct, 3:not correct, 4:not correct, 5:not correct")
                end 
            end 
        end 
    end 
end

