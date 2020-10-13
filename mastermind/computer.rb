# computer.rb / cpu game methods
require_relative "game_methods"

class Cpu < Mastermind
    include GameMethods
    def initialize
        @name = "cpu"
    end
end
