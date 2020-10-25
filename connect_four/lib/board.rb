require_relative "game_methods"
class Board
    include GameMethods
    attr_accessor :board
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
                column << [""]
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
    def print_board
        board_to_print = self.board_to_evaluate

    end
end