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
    @value = nil
    attr_accessor :right_child, :left_child, :value
    def initialize(value)
        @value = value
    end
end

def build_tree_(list)
    root = list[list.length/2]
    root_content = root
    root = Node.new(root_content)
    # 1. base case
    if list.length == 1 
        return root
    end

    # 2. recursive case
    left_side = list[0..(list.length/2)-1]
    right_side = list[(list.length/2)+1..list.length-1]
    unless left_side.length == 0
        left_link = build_tree_(left_side)
    end
    unless right_side.length == 0
        right_link = build_tree_(right_side)
    end

    # root conections
    root.left_child = left_link
    root.right_child = right_link

    return root
end