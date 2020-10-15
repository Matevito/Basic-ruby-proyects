# Game methods
def load_dictionary
    dictionary = File.open("5desk.txt", "r") {|text| text.read}
    dictionary.gsub!(/\r\n?/, "\n")
    content = []
    dictionary.each_line {|word| content.push(word.chomp)}
    return content
end
def get_random_word(list)
    secret_word = list.sample
    while secret_word.length > 12 || secret_word.length < 5
        secret_word = list.sample
    end
    return secret_word
end

class Hangman
    # Game methods
    attr_reader :secret_word
    attr_accessor :word_output, :turn, :guesses, :wrong_words
    def initialize(name)
        @name = name
        @guesses = 8
        @turn = 1
        @secret_word = Hangman.get_secret_word
        @word_output = "-"*secret_word.length
        @wrong_words = []
    end
    def self.get_secret_word
        dictionary = load_dictionary
        get_random_word(dictionary)
    end
    def print_board
        puts"
        turn:#{turn}
        guesses left:#{guesses}
        #{word_output}
        Wrong words: #{wrong_words.join(", ")}"
    end
    def check_guess
        @turn += 1
    end
end

# Game logic
current_game = Hangman.new("mateo")
current_game.print_board
