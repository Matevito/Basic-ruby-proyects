require_relative "objects"
require_relative "chess_notation"

knight_piece = Knight.new()
#p knight_piece.knight_moves([0,0],[3,3]) # => [[0, 0], [1, 2], [3, 3]]
p knight_piece.knight_moves([1,2],[7,7]) # => [[1, 2], [2, 4], [3, 6], [4, 4], [5, 6], [7, 7]]