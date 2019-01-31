require 'random-word'

f = File.open('./words.txt', 'a')

1000.times do   
    f.write(RandomWord.nouns(not_shorter_than: 5, not_longer_than: 5).next + "\n")
end 

f.close