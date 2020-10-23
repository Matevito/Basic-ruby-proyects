# frozen_string_literal: true

# player.rb
require_relative 'game_board'

class Player < Game_ttt
  attr_reader :name, :board_sign, :turn, :board
  def initialize(name, board_sign)
    @name = name
    @board_sign = board_sign
  end

  def make_move
    puts "player #{name}, make your move: "
    move = gets.chomp
    # esception if the choosen cell has been already selected
    until @@board[move] == ' '
      puts 'the cell has already been taken. Choose another cell'
      puts "player #{name}, make your move: "
      move = gets.chomp
    end
    # perform the move in the board
    @@board[move] = board_sign
    Game_ttt.print_gui
    @@turn += 1
  end
end
