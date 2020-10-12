# game_board.rb

class Game_ttt
    @@turn = 1
    @@board = {
        "1" => " ",
        "2" => " ", 
        "3" => " ",
        "4" => " ", 
        "5" => " ",
        "6" => " ", 
        "7" => " ",
        "8" => " ", 
        "9" => " "}
    # methods to print the current state of the board
    def self.print_board
        puts "#{@@board["7"]}|#{@@board["8"]}|#{@@board["9"]}"
        puts "-----"
        puts "#{@@board["4"]}|#{@@board["5"]}|#{@@board["6"]}"
        puts "-----"
        puts "#{@@board["1"]}|#{@@board["2"]}|#{@@board["3"]}"
    end
    def self.print_gui
        puts "Tic-Tac_Toe"
        puts "Turn: #{@@turn}"
        self.print_board
    end
    # reset board_game
    def self.reset_bg
        @@turn = 1
        @@board.each do|key, value| 
            @@board[key] = " "
        end
    end
    # check game_state
    def self.check_game_state()
        # check if someone has won
        case 
            when (@@board["1"] == @@board["2"] && @@board["2"] == @@board["3"]) &&@@board["1"] != " "
                return true  
            when (@@board["4"] == @@board["5"] && @@board["5"] == @@board["6"]) &&@@board["4"] != " "
                return true     
            when (@@board["7"] == @@board["8"] && @@board["8"] == @@board["9"]) &&@@board["7"] != " "
                return true   
            when (@@board["1"] == @@board["4"] && @@board["4"] == @@board["7"]) &&@@board["1"] != " "
                return true      
            when (@@board["2"] == @@board["5"] && @@board["5"] == @@board["8"]) &&@@board["2"] != " "
                return true   
            when (@@board["3"] == @@board["6"] && @@board["6"] == @@board["9"]) &&@@board["3"] != " "
                return true  
            when (@@board["1"] == @@board["5"] && @@board["5"] == @@board["9"]) &&@@board["1"] != " "
                return true  
            when (@@board["7"] == @@board["5"] && @@board["5"] == @@board["3"]) &&@@board["7"] != " "
                return true  
        end
        # check if it's a draw //turn 10 and there's no winner
        return "draw" if @@turn == 10
        return false
    end
    def self.get_turn
        @@turn
    end
    #
end