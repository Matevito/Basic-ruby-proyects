require "yaml"
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
    puts"\nPlayer, put your guess or [save] to save the game:"
    guess = gets.chomp

    #exception if gonna save the game
    return "save" if guess == "save"
    
    # reject guesses longer than one character, symbols and numbers
    while guess.length > 1 || !guess.match?(/\w/) || guess.match?(/\A-?\d+\Z/)
        puts"\nYour input is invalid, try again!"
        guess = gets.chomp
    end
    return guess
end
def save_game(object)
    save_file = YAML::dump(object)
    game_file = File.new("save_file.yaml", "w")
    game_file.write(save_file)
end
def load_game
    game_file = File.new("save_file.yaml", "r")
    saved_file = game_file.read
    YAML::load(saved_file)
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
#p current_game.secret_word

# This is used to control the game loop
while current_game.guesses > 0
    # loop of the game
    current_game.print_board
    player_guess = take_guess

    # save and stop the game if player_guess == "save"
    if player_guess == "save"
        save_game(current_game)
        break
    end

    current_game.check_guess(player_guess)

    # if the word is guessed the game stops!
    if current_game.secret_word == current_game.word_output
        p "you win!"
        break
    end
end