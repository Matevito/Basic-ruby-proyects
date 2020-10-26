require_relative "board"
require_relative "player"

class Game
    def play_game
        current_board = Board.new
        # create players
        player_1 = self.get_name(1,"x")
        player_2 = self.get_name(2,"o")
        
        loop do
            current_board.print_board
            symbol = player_1.symbol
            current_board.make_move(symbol)
            current_status = current_board.check_status
            if current_status == true
                current_board.print_board
                puts "\n#{player_1.name} is the Winner!"
                break
            elsif current_status == "draw"
                current_board.print_board
                puts "\nThe game is a draw!"
                break
            end
            current_board.print_board
            symbol = player_2.symbol
            current_board.make_move(symbol)
            current_status = current_board.check_status
            if current_status == true
                current_board.print_board
                puts "\n#{player_2.name} is the Winner!"
                break
            elsif current_status == "draw"
                current_board.print_board
                puts "\nThe game is a draw!"
                break
            end
        end
        puts "\nGame ended."
    end
    def get_name(number_player, symbol)
        puts "\nputs name of player #{number_player}."
        name = gets.chomp
        player = Player.new(name)
        player.symbol = symbol
        return player
    end
end