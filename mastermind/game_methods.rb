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

end

class Mastermind
    include GameMethods
    @@game_turns = 12
    @@game_guesses = []
    @@secret_code = [1,2,4,6]                                           #i need this stable for debbuging   
    def generate_secret_code
        @secret_code = random_guess()
    end
    def game_turns
        @@game_turns
    end
    def secret_code
        @@secret_code                                                    ##remove an @
    end
    def check_guess(guess_)
        # output:an array [color_position, color]
        @@game_guesses.push(guess_)
        # check color-position
        position = 0
        @@secret_code.each_with_index do |number, index|                ##remove an @
            if number == guess_[index]
                position += 1
                guess_[index] = 0
            end
        end
        #check just color
        color =  0
        guess_.each do |number|
            if @@secret_code.include?(number)                           ##remove an @
                color += 1
            end
        end
        # return the results of the analysis
        return [position, color]
    end
end

game =  Mastermind.new
p game.check_guess([1,2,3,4])
