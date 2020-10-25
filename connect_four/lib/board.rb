class Board
    attr_accessor :board
    def initialize
        @board = Array.new(7,[])
    end
    def board_to_evaluate
        new_board = @board
        new_board.each do |column|
            until column.size == 7
                column << [""]
            end
        end
        return new_board
    end
    def check_status
    
    end
end