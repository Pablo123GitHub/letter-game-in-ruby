require_relative('../lib/game.rb')

describe Game do

    before(:all) do 
        @game = Game.new({one: "B", two: "A", three: "C", four: "E", five: "F"})
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

    context "the Game class records player's response" do 
        player_response1 = {
            one: "A",
            two: "B",
            three: "C",
            four: "D",
            five: "E"
        } 

        player_response2 = {
            one: "E",
            two: "B",
            three: "C",
            four: "D",
            five: "A"
        } 
        
        it "records respons1 as player's response" do   
            @game.player_response(player_response1)
            expect(@game.show_player_response()).to eq(player_response1)
        end 

        it "records respons2 as player's response" do   
            @game.player_response(player_response2)
            expect(@game.show_player_response()).to eq(player_response2)
        end 
    end 


end

