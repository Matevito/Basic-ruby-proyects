require_relative "board"
require_relative "player"

class Game
    def play_game
        current_board = Board.new
        # create players
        puts "puts name of player 1."
        name = gets.chomp
        player_1 = self.get_name(1,"x")
        player_2 = self.get_name(2,"o")
        
        until current_board.check_status
            
        end
    end
    def get_name(number_player, symbol)
        puts "\nputs name of player #{number_player}."
        name = gets.chomp
        player = Player.new(name)
        player.symbol = symbol
        return player
end

connect_four = Game.new
connect_four.play_game