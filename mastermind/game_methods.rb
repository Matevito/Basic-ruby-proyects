# game_methods.rb
module GameMethods
    def random_guess()
        possible_nums = [1,2,3,4,5,6]
        guess = []
        4.times do
            guess.push(possible_nums.sample)
        end
        return guess
    end
    def print_game_evaluation(results)
        puts"Position and number correct: #{results[0]}"
        puts"Just number correct: #{results[1]}"
    end
end

class Mastermind
    include GameMethods
    @@game_guesses = []  #this can be saved in the cpu                                                  
    def check_guess(guess_, secret_code)
        # output:an array [color_position, color]
        @@game_guesses.push(guess_)
        # check color-position
        position = 0
        color =  0
        guess_.each_with_index do |number, index|
            if number == secret_code[index]
                position += 1
                secret_code[index] = 0 #to not affect the count of just color
            elsif secret_code.include?(number) 
                color += 1
            end
        end
        # return the results of the analysis
        return [position, color]
    end
end