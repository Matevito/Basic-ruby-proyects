require 'yaml'
require_relative "GameObj"
# Game methods
def load_dictionary
  dictionary = File.open('5desk.txt', 'r') { |text| text.read }
    dictionary.gsub!(/\r\n?/, "\n")
    content = []
  dictionary.each_line { |word| content.push(word.chomp) }
  content
end

def get_random_word(list)
    secret_word = list.sample
  secret_word = list.sample while secret_word.length > 12 || secret_word.length < 5
  secret_word
    end

def take_guess
  puts "\nPlayer, put your guess or [save] to save the game:"
    guess = gets.chomp

    # exception if gonna save the game
  return 'save' if guess == 'save'
    
    # reject guesses longer than one character, symbols and numbers
    while guess.length > 1 || !guess.match?(/\w/) || guess.match?(/\A-?\d+\Z/)
    puts "\nYour input is invalid, try again!"
        guess = gets.chomp
    end
  guess
end

def save_game(object)
  save_file = YAML.dump(object)
  game_file = File.new('save_file.yaml', 'w')
    game_file.write(save_file)
end

def load_game
  game_file = File.new('save_file.yaml', 'r')
    saved_file = game_file.read
    YAML::load(saved_file)
end

def play_hangman(current_game)
  while current_game.guesses > 0
    # loop of the game
    current_game.print_board
    player_guess = take_guess

    # save and stop the game if player_guess == "save"
    if player_guess == 'save'
      save_game(current_game)
      break
    end

    current_game.check_guess(player_guess)

    # if the word is guessed the game stops!
    next unless current_game.secret_word == current_game.word_output
      puts 'You win!'
      puts "The secret word was: #{current_game.secret_word.join}"
      break
    end
    if current_game.guesses == 0
      puts "You lost the game, the secret word was: #{current_game.secret_word.join}"
    end
  # Message if the game is lost
end