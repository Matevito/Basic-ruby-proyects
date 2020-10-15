require_relative "logicMethods"
class Hangman
    # Game methods
    attr_reader :secret_word
    attr_accessor :word_output, :turn, :guesses, :wrong_words
    def initialize
        @guesses = 8
        @turn = 1
      @secret_word = Hangman.get_secret_word.downcase.split('')
      @word_output = ('-' * secret_word.length).split('')
        @wrong_words = []
    end

    def self.get_secret_word
        dictionary = load_dictionary
        get_random_word(dictionary)
    end

    def print_board
    puts "
        Turn:#{turn}
        Guesses left:#{guesses}
        #{word_output.join('')}
        Wrong words: #{wrong_words.join(', ')}"
    end

    def check_guess(guess)
        @turn += 1
      # remember, case insensitive
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
