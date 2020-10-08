
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(text, dictionary)
    text = text.downcase

    #takes the words in dictionary that are substring of text
    substrings_words = dictionary.select {|word| text.include?(word)}

    puts substrings_words

    substring = Hash.new(0)
    #make the hash
    substrings_words.each do |word|
        substring[word] += 1
    end

    substring
    

end

#test
puts substrings("Howdy partner, sit down! How's it going?", dictionary)