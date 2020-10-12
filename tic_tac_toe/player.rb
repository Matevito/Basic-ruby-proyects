# player.rb
require_relative "game_board"

class Player < Game_ttt
    attr_reader :name, :board_sign, :turn, :board
    def initialize(name, board_sign)
        @name = name
        @board_sign = board_sign
    end
    def make_move(move)
        @@board[move] = board_sign
    end
end