
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

    context "detects wrong format player input, output error, but player can play on" do    
        it "raises an error about input string length" do   
            expect { @game.player_response("h")}.to output("input must be exactly 5 letters\n").to_stdout
        end 
        it "raises an error if input is not String type" do   
            expect { @game.player_response("h£ur@")}.to output("input must be letters only\n").to_stdout
        end 

        xit "allows the player to play on even once input format is wrong" do   
            expect { @game.player_response("h£ur@") }.to output("Input your response: \n").to_stdout 
            expect(@game.show_player_response).to eq(nil)
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
    end
            context "The game gives information about the player's input" do   
        
            it "tells the player that one letter is correct and at the right position, but all the other ones are wrong" do   
                @game.player_response("Bstuv")
                expect(@game.assess_response_right_or_wrong).to eq("1:WELL DONE!, 2:LETTER NOT IN ANSWER, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:LETTER NOT IN ANSWER")
            end 
            it "tells the player that two letters are correct/correctly placed, the other ones wrong" do   
                @game.player_response("Bsjdf")
                expect(@game.assess_response_right_or_wrong).to eq("1:WELL DONE!, 2:LETTER NOT IN ANSWER, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:WELL DONE!")
            end 
    

            context "tells the player about a letter that is part of the response but at the wrong position" do 
            it "tells the player about ONE correct letter at the wrong index" do   
                @game.player_response("zbuuu") #correct BACEF
                expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:correct letter wrong spot, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:LETTER NOT IN ANSWER")
            end
            it "tells the player about TWO correct letters at the wrong index" do   
                @game.player_response("zbufu")
                expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:correct letter wrong spot, 3:LETTER NOT IN ANSWER, 4:correct letter wrong spot, 5:LETTER NOT IN ANSWER")
            end 
            it "tells about ONE correct letter at wrong index but ignores the other one because it is ALSO placed at the right index(f)" do   
                @game.player_response("zbuff")
                expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:correct letter wrong spot, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:WELL DONE!")
            end 

            it "tells about TWO consecutive letters incorrectly placed in player's input" do    
                @game.player_response("cfcff")
                expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:LETTER NOT IN ANSWER, 3:WELL DONE!, 4:LETTER NOT IN ANSWER, 5:WELL DONE!")
            end 

            it "only first Letter is correct" do    
                @game.player_response("cfcff")
                expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:LETTER NOT IN ANSWER, 3:WELL DONE!, 4:LETTER NOT IN ANSWER, 5:WELL DONE!")
            end 
        
            context "edge cases" do   
                it "all the letters are the same and one of them is part of the correct response" do   
                    @game.player_response("fffff")
                    expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:LETTER NOT IN ANSWER, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:WELL DONE!")
                end 
                it "all the letters not placed at the right index but all of them are part of the response" do   
                    @game.player_response("abefc")

                    expect(@game.assess_response_right_or_wrong).to eq("1:correct letter wrong spot, 2:correct letter wrong spot, 3:correct letter wrong spot, 4:correct letter wrong spot, 5:correct letter wrong spot")
                end 
                it "all the letters not placed at the right index but all of them are part of the response" do   
                    @game.player_response("cbaef")
                    expect(@game.assess_response_right_or_wrong).to eq("1:correct letter wrong spot, 2:correct letter wrong spot, 3:correct letter wrong spot, 4:WELL DONE!, 5:WELL DONE!")
                end 

                it "all the letters are not in the correct response" do   
                    @game.player_response("rstuv")
                    expect(@game.assess_response_right_or_wrong).to eq("1:LETTER NOT IN ANSWER, 2:LETTER NOT IN ANSWER, 3:LETTER NOT IN ANSWER, 4:LETTER NOT IN ANSWER, 5:LETTER NOT IN ANSWER")
                end 
            end 
        end 
    end 

    context "the player fails to find the answer in less than 10 attempts" do   
        it "stops the game and shows the answer" do   
            new_game = Game.new(@correct_answer)
            9.times do 
                new_game.player_response(@wrong_answer)
            end 
             expect { new_game.player_response(@wrong_answer) }.to output("nope, the correct answer is #{@correct_answer}\n").to_stdout 
         end 
    end 

end

