#main.rb
require_relative "player"

puts "gonna play a game of tic-tac-toe?(y/n)"
gonna_play = "y"                                            #to erase when done
# gonna_play = gets.chomp
while gonna_play == "y"
    #
    puts "player 1(X) nickname: "
    #name_1 = gets.chomp
    name_1 = "mateo"                                        #to erase when done
    sign_1 = "X"
    player_1 = Player.new(name_1, sign_1)
    puts "player 2(O) nickname: "
    #name_2 = gets.chomp
    name_2 = "Charles"                                      #to erase when done
    sign_2 = "O"
    player_2 = Player.new(name_2, sign_2)
    # todo: print game instructions // this goes here or before?

    # play the game
    game_done = false
    until game_done
        # make move
        player_1.make_move
        Game_ttt.print_gui

        # check board state
        game_done = Game_ttt.check_game_state
        if game_done != false
            break
        end

        # now with player 2
        player_2.make_move
        Game_ttt.print_gui
        game_done = Game_ttt.check_game_state
    end

    p "game_finished"

    # fence-post bugg solve
    puts "gonna play a game of tic-tac-toe?(y/n)"
    gonna_play = gets.chomp
end