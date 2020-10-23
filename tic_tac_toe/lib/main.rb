# frozen_string_literal: true

# main.rb
require_relative 'player'

puts 'gonna play a game of tic-tac-toe?(y/n)'
gonna_play = 'y' # to erase when done
# gonna_play = gets.chomp
while gonna_play == 'y'
  # get players info
  puts 'player 1(X) nickname: '
  name_1 = gets.chomp
  sign_1 = 'X'
  player_1 = Player.new(name_1, sign_1)

  puts 'player 2(O) nickname: '
  name_2 = gets.chomp
  sign_2 = 'O'
  player_2 = Player.new(name_2, sign_2)
  # TODO: print game instructions // this goes here or before?

  # play the game
  game_done = false
  until game_done
    # make move
    player_1.make_move

    # check board state
    game_done = Game_ttt.check_game_state
    break if game_done != false

    # now with player 2
    player_2.make_move
    game_done = Game_ttt.check_game_state
  end

  # final message // is good to this being a method of Game_ttt?
  current_turn = Game_ttt.get_turn
  if current_turn.even? && current_turn < 10
    p "#{name_1} wins!"
  elsif current_turn.odd?
    p "#{name_2} wins!"
  else
    p "it's a draw!"
  end

  # fence-post bugg solve
  puts 'gonna play a game of tic-tac-toe?(y/n)'
  gonna_play = gets.chomp
  Game_ttt.reset_bg
end
