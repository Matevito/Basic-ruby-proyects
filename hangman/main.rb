require_relative "GameObj"
# Game logic
# todo: print introduction and rules
while true
  puts "\nLoad game[l] or New game[n]"
  game_mode = gets.chomp
  # TODO: a method that only accepts [l] and [n]

  # load or save the game
  current_game = if game_mode == 'l'
                  load_game
                else
                  Hangman.new
  end
  play_hangman(current_game)
  puts"\nThanks for playing!"
  puts"\n[e]: exit game // else to continue playing"
  response = gets.chomp
  break if response.downcase == "e"
end