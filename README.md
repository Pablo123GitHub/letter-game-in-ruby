# Motus

A terminal command game based on a famous French TV show called Motus. Work in progress but the main features are already available. 

<img src="library/logo.png" width="150" height="100">


## Built With

* Ruby 2.4.2
* Tested with Rspec 3.8
* One gem depency to generate random words called....[random-word](https://rubygems.org/gems/random-word/versions/1.3.0).

## Running the tests

We have two classes : Game and RandomString available under the lib folder. And we have their respective test files under the spec folder.  

In order to run the test, just type rspec in terminal and press Enter:

```
rspec
```

A series of green dots show that all the tests have passed. 

## Getting Started

We need to install the dependencies (just one gem) before getting started 

```
bundle install
```

We can then start the game by executing the runner.rb file:

```
ruby runner.rb
```

## How to play 

The aim of the game is to find a random 5 letter word (generated by the random-word gem). The player has 10 attempts, and if she fails to find the word, she loses and the correct response is displayed. 

The player gets clues along the way. Each letter has a position : 1, 2, 3, 4, 5. The game will give the following information for each letter in the player's response : 

   * WELL DONE!  --> when it is the correct letter at the right position 
   * correct letter wrong spot  --> when the word contains this letter, but it is not located at the right position
   * LETTER NOT IN ANSWER --> when the word does NOT contain this letter at all. 


