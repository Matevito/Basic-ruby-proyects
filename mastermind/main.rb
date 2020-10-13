# main.rb / here goes the logic skeleton of the program
require_relative "game_methods"
require_relative  "human"
require_relative  "computer"

# game logic
# player_guesser code
loop do
    #puts "Player, put your name: "
    #name = gets.chomp
    name = "charles"                                  # for construction reasons
    player_1 = Human_player.new(name)
    mastermind = Cpu.new
    current_game = Mastermind.new


    # generating secret code
    #secret_code = mastermind.random_guess
    secret_code = [3,1,1,5]
    turn = 12

    # play the game
    for i in (1..12)
        puts "\nguesses left: #{turn}"
        p secret_code
        code_to_check = secret_code
        guess = player_1.take_a_guess
        guess_results = current_game.check_guess(guess, code_to_check)
        p guess_results

        current_game.print_game_evaluation(guess_results)
        break if guess_results[0] == 4

        turn -=1
    end
    break
end