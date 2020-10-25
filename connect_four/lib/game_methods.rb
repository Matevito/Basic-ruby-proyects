module GameMethods
    def check_pattern (element_patterns)
        element_patterns.each do |line|
            if line.include? "xxxx"
                return true
            elsif line.include? "oooo"
                return true
            end
        end
        return false
    end
    def check_rows(board)
        rows = []
        for i in (0..6) do
            row = []
            for y in (0..6) do
                row << board[y][i]
            end
            rows << row.join("")
        end
        return check_pattern(rows)
    end
    def check_columns(board)
        columns = []
        board.each do |column|
            columns << column.join("")
        end
        return check_pattern(columns)
    end

    def check_diagonals(board)
        diagonals = []
        # get the middle of the board
        middle = []
        for i in (0..6)
            middle << board[i][i]
        end
        diagonals << middle.join("")

        # todo:automate this!
        # get left diagonal part
        
        # get right diagonal part
    end
end