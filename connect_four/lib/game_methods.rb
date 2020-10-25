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
        middle_l = []
        for i in (0..6)
            middle_l << board[i][i]
        end
        diagonals << middle_l.join("")

        middle_r = []
        for i in (0..6)
            middle_r << board[0+i][6-i]
        end
        diagonals << middle_r.join("")

        # 1.LEFT TO RIGHT!
        # get left diagonal part
        diagonals << [board[0][1],board[1][2],board[2][3],board[3][4],board[4][5],board[5][6]].join("")
        diagonals << [board[0][2],board[1][3],board[2][4],board[3][5],board[4][6]].join("")
        diagonals << [board[0][3],board[1][4],board[2][5],board[3][6]].join("")
        # get right diagonal part
        diagonals << [board[1][0],board[2][1],board[3][2],board[4][3],board[5][4],board[6][5]].join("")
        diagonals << [board[2][0],board[3][1],board[4][2],board[5][3],board[6][4]].join("")
        diagonals << [board[3][0],board[4][1],board[5][2],board[6][3]].join("")

        #2. RIGHT TO LEFT
        # get up diagonal part
        diagonals << [board[1][6],board[2][5],board[3][4],board[4][3],board[5][2],board[6][1]].join("")
        diagonals << [board[2][6],board[3][5],board[4][4],board[5][3],board[6][2]].join("")
        diagonals << [board[3][6],board[4][5],board[5][4],board[6][3]].join("")
        # get down diagonal part
        diagonals << [board[5][0],board[4][1],board[3][2],board[2][3],board[1][4],board[0][5]].join("")
        diagonals << [board[4][0],board[3][1],board[2][2],board[1][3],board[0][4]].join("")
        diagonals << [board[3][0],board[2][1],board[1][2],board[0][3]].join("")
        return check_pattern(diagonals)
    end
end