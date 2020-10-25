class Board
    attr_accessor :board
    def initialize
        @board = Array.new(7,[])
    end
end

checks = Board.new
p checks.board