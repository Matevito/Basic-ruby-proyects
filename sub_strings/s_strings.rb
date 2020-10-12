# s_strings.rb found substrings in a text with words provided in a dictionary; the output is a hash with the number of appereances

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(text, dictionary)
  text = text.downcase.split

  substrings_words = []

  # iterate all words in the text
  text.each do |word_text|
    # takes the words in dictionary that are substring of word_text
    substrings_words += dictionary.select { |word| word_text.include?(word) }
  end

  # make the hash
  substring_hash = Hash.new(0)
  substrings_words.each do |word|
    substring_hash[word] += 1
  end

  substring_hash
end

# test

substrings("Howdy partner, sit down! How's it going?", dictionary)
#=>{"how"=>2, "howdy"=>1, "part"=>1, "partner"=>1, "it"=>2, "i"=>3, "sit"=>1, "down"=>1, "own"=>1, "go"=>1, "going"=>1}

substrings('below', dictionary)
#=>{"below"=>1, "low"=>1}
