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

def build_tree(list)
    root = list[list.length/2]

    # base case
    if list.length == 1 
        return root
    end

    #recursive case
    left_side = list[0..(list.length/2) -1]
    right_side = list[(list.length/2)+1..list.length-1]
    p "#{left_side} left "
    sleep(0.5)
    p "#{right_side} right "
    sleep(0.5)

    left_link = build_tree(left_side)
    right_link = build_tree(right_side)

    # build the node
    root_content = root
    root = Node.new(root_content)
    # root conections
    root.left_child(left_link)
    root.right_child(right_link)

    return root
end

p build_tree([1,2,3,4,5,6,7])
class Tree
    @root = nil
    attr_accessor :root
    def initialize(list)
        @list = list
    end
    def build_tree
        # 1. remove duplicates
        new_list = []
        @list.each do |element|
            unless new_list.include?(element)
                new_list.push(element)
            end
        end
        # 2. sort the elements
        @list = new_list.sort

        # 3. make the tree

    end
end

number_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

#sorted_list = Tree.new(number_array)
#p sorted_list.build_tree