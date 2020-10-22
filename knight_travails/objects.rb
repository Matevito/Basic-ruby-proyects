require_relative "chess_notation"
class Board
    def valid_move?(position)
        return false if position[0] < 0 || position[1] < 0
        return false if position[0] > 7 || position[1] > 7
        return true
    end
    def flatten_path(path)
        # i havent found how to solve the indentation in the paths, so i will flatten and reorder the solutions with this
        path = path.flatten
        new_path = []
        (path.size/2).times do
            new_path << [path[0], path[1]]
            path.shift(2)
        end
        return new_path
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
        loop do
        queue = paths
        valid_paths = []
        queue.each do |path|
            new_paths = posible_moves(path[-1])
            not_repeated = []
            new_paths.each do |node|
                unless path.include?(node)
                    not_repeated << node
                end
            end
            not_repeated.each do |n|
                valid_paths << [path] + [n]
            end
            valid_paths.each do |n|
                if n[-1] == destination
                    return flatten_path(n)
                end
            end
        end
        paths = valid_paths
    end
    end
end
knight = Knight.new
p knight.knight_moves([0,0],[7,6])

#todo: check indentation of each path
