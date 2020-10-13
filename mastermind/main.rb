# main.rb / here goes the logic skeleton of the program
require_relative 'game_methods'
require_relative  'human'
require_relative  'computer'

# game logic
# player_guesser code
print_rules
intro_input = gets.chomp
loop do
  name = 'charles'
  if intro_input == '1'
    # guessing the code of a cpu
    # puts "Player, put your name: "
    # name = gets.chomp
    player_1 = Human_player.new(name)
    mastermind = Cpu.new
    current_game = Mastermind.new

    # generating secret code
    secret_code = mastermind.random_guess
    turn = 12

    # play the game
    (1..12).each do |_i|
      puts "\nguesses left: #{turn}"
      # this is needed to solve a bugg
      code_to_check = current_game.make_copy(secret_code)
      guess = player_1.take_a_guess

      # check the guess
      guess_results = current_game.check_guess(guess, code_to_check)
      current_game.print_game_evaluation(guess_results)
      break if guess_results[0] == 4

      turn -= 1
    end

    # result message
    if guess_results[0] == 4
      puts "\nCongratulations #{name}, the secret code was #{secret_code}"
    else
      puts "\nNo, the secret code was #{secret_code.join}."
    end
  elsif intro_input == '2'
    # vs cpu easy mode
    # puts "Player, put your name: "
    # name = gets.chomp
    player_1 = Human_player.new(name)
    computer_player = Cpu.new
    current_game = Mastermind.new

    puts "\n#{name}, input your secret code"
    secret_code = gets.chomp
    secret_code = secret_code.chars.map { |number| number.to_i }
    turn = 12

    (1..12).each do |_i|
      puts "\nguesses left: #{turn}"
      guess = computer_player.random_guess
      puts "cpu guess is: #{guess}"
      code_to_check = current_game.make_copy(secret_code)
      guess_results = current_game.check_guess(guess, code_to_check)
      current_game.print_game_evaluation(guess_results)
      break if guess_results[0] == 4

      turn -= 1
      puts 'the cpu is thinking...'
      sleep(3)
    end
    if guess_results[0] == 4
      puts "\nSorry, but this cpu has a lot of luck!"
    else
      puts "\nGood work there, #{name}. But this cpu is too dumb!"
    end
  elsif intro_input == '3'
    # TODO: vs cpu hard mode
  end
  # fence post bugg
  print_rules
  intro_input = gets.chomp
end
