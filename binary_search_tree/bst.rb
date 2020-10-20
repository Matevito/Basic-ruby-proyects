module Comparable
    def greater_than(node)
        if self.value > node.value
            return true
        else 
            return false
        end
    end
    def lower_than(node)
        if self.value < node.value
            return true            
        else
            return false
        end
    end
    def equal_to(node)
        if self.value == node.value
            return true
        else
            return false
        end
    end
end

class Node
    include Comparable
    @right_child = nil
    @left_child = nil
    attr_accessor :right_child, :left_child, :value
    def initialize(value)
        @value = value
    end
end

class Tree

end