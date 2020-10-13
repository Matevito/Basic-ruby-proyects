# human.rb / human_player methods
require_relative "game_methods"
class Human_player < Mastermind
    attr_reader :name
    def initialize(name)
        @name = name
    end
    def take_a_guess()
        puts "#{@name}, what is your guess?"
        puts "digit a combination of 4 numbers using digits from 1-6: "
        guess = gets.chomp
        # chars makes an array with each element of the string
        guess = guess.chars.map {|number| number.to_i}
        return guess
    end
end