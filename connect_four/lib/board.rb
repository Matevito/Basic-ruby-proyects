require_relative "game_methods"
class Board
    include GameMethods
    attr_accessor :board, :game_turn
    def initialize
        @board = Array.new(7,[])
        @game_turn = 0
    end
    def board
        @board.dup
    end
    def board_to_evaluate
        # clone board variable
        new_board = @board.dup.map(&:dup)

        # fill with blank spaces the board
        new_board.each do |column|
            until column.size == 7
                column << " "
            end
        end
        return new_board
    end
    def check_status
        rows_state = check_rows(self.board_to_evaluate)
        columns_state = check_columns(self.board_to_evaluate)
        diagonals_state = check_diagonals(self.board_to_evaluate)

        if rows_state == true || columns_state == true || diagonals_state == true
            return true
        elsif @game_turn == 49
            return "draw"
        else
            return false
        end
    end
    def make_move(symbol)
        puts "make a move(1-7):"
        column = gets.chomp.to_i
        column -= 1
        until @board[column].size < 7
            puts "make a valid move(1-7):"
            column = gets.chomp.to_i
            column -= 1
        end
        @game_turn += 1
        @board[column] = @board[column] + [symbol]
    end
    def print_board
        board_ = self.board_to_evaluate
        puts "\nCurrent turn:#{@game_turn+1}"
        puts "——"*7
        for i in (0..6) do
            puts "|#{board_[0][6-i]}|#{board_[1][6-i]}|#{board_[2][6-i]}|#{board_[3][6-i]}|#{board_[4][6-i]}|#{board_[5][6-i]}|#{board_[6][6-i]}|"
            puts "——"*7
        end
        puts "|1|2|3|4|5|6|7|"
    end
end