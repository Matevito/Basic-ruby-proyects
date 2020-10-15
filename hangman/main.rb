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
def take_guess
    puts"\nPlayer, put your guess:"
    guess = gets.chomp
    
    # reject guesses longer than one character, symbols and numbers
    while guess.length > 1 || !guess.match?(/\w/) || guess.match?(/\A-?\d+\Z/)
        puts"\nYour input is invalid, try again!"
        guess = gets.chomp
    end
    return guess
end

class Hangman
    # Game methods
    attr_reader :secret_word
    attr_accessor :word_output, :turn, :guesses, :wrong_words
    def initialize
        @guesses = 8
        @turn = 1
        @secret_word = Hangman.get_secret_word.downcase.split("")
        @word_output = ("-"*secret_word.length).split("")
        @wrong_words = []
    end
    def self.get_secret_word
        dictionary = load_dictionary
        get_random_word(dictionary)
    end
    def print_board
        puts"
        Turn:#{turn}
        Guesses left:#{guesses}
        #{word_output.join("")}
        Wrong words: #{wrong_words.join(", ")}"
    end
    def check_guess(guess)
        @turn += 1
        #remember, case insensitive
        guess = guess.downcase

        unless secret_word.include?(guess)
            @guesses -= 1
            wrong_words.push(guess)
        end

        secret_word.each_with_index do |character, index|
            word_output[index] = character if guess == character
        end
    end
end

# Game logic
current_game = Hangman.new

# This is used to control the game loop
current_turn = current_game.turn

current_game.print_board
p current_game.secret_word
player_guess = take_guess
current_game.check_guess(player_guess)