class Board
    def valid_move?(position)
        return false if position[0] < 0 || position[1] < 0
        return false if position[0] > 7 || position[1] > 7
        return true
    end
end
class Knight < Board
    def posible_moves(current_position)
        list_moves = []
        # generate moves
        list_moves << [current_position[0]+1, current_position[1]+2]
        list_moves << [current_position[0]+2, current_position[1]+1]
        list_moves << [current_position[0]-1, current_position[1]+2]
        list_moves << [current_position[0]-2, current_position[1]+1]
        list_moves << [current_position[0]+2, current_position[1]-1]
        list_moves << [current_position[0]+1, current_position[1]-2]
        list_moves << [current_position[0]-1, current_position[1]-2]
        list_moves << [current_position[0]-2, current_position[1]-1]

        # remove invalid moves
        valid_moves = []
        list_moves.each do |cell|
            if valid_move?(cell)
                valid_moves << cell
            end
        end
        return valid_moves
    end
end
knight = Knight.new
p knight.posible_moves([0,0])
