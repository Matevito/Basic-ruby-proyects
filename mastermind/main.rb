# main.rb / here goes the logic skeleton of the program
require_relative "game_methods"
require_relative  "human"
require_relative  "computer"

# game logic
# player_guesser code
print_rules()
intro_input = gets.chomp
loop do
    name = "charles" 
    if intro_input == "1"
    #guessing the code of a cpu
        #puts "Player, put your name: "
        #name = gets.chomp
        player_1 = Human_player.new(name)
        mastermind = Cpu.new
        current_game = Mastermind.new

        # generating secret code
        secret_code = mastermind.random_guess
        turn = 12

        # play the game
        for i in (1..12)
            puts "\nguesses left: #{turn}"
            # this is needed to solve a bugg
            code_to_check = current_game.make_copy(secret_code)
            guess = player_1.take_a_guess

            # check the guess
            guess_results = current_game.check_guess(guess, code_to_check)
            current_game.print_game_evaluation(guess_results)
            break if guess_results[0] == 4
            turn -=1
        end
        
        # result message
        if guess_results[0] == 4
            puts "\nCongratulations #{name}, the secret code was #{secret_code}"
        else
            puts "\nNo, the secret code was #{secret_code.join}."
        end
    elsif intro_input == "2"
    # vs cpu easy mode
        
    elsif intro_input == "3"
    # todo:vs cpu hard mode
    end
    # fence post bugg
    print_rules()
    intro_input = gets.chomp
end