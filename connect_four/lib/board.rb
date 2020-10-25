class Board
    attr_accessor :board
    def initialize
        @board = Array.new(7,[])
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
    
    end
    def print_board

    end
end