require_relative "chess_notation"
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
        list_moves.each {|cell| valid_moves << cell if valid_move?(cell)}
        return valid_moves
    end
    def knight_moves(current_position, destination)
        paths = [current_position]
    solution = nil
    until solution != nil
        sleep(1.5)
        queue = paths
        valid_paths = []
        queue.each do |path|
            p "this is the current path: #{path}"
            p "this is what's being evaluated #{path[-1]}"
            # todo: case if path length is 1
            new_paths = posible_moves(path[-1])
            # todo: remove moves that have already happen
            not_repeated = []
            new_paths.each do |node|
                unless path.include?(node)
                    not_repeated << node
                end
            end
            p "valid pahts #{not_repeated}"
            not_repeated.each do |n|
                valid_paths << [path] + [n]
            end
            sleep(1.5)
            p "valid paths"
            valid_paths.each do |n|
                p n
            end
        end
        paths = valid_paths
    end
    end
end
knight = Knight.new
p knight.knight_moves([0,0],[5,5])
