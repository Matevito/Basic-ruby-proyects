require_relative "tree_methods"

class Tree
    @root = nil
    attr_accessor :root, :list
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
        @root = build_tree_(@list)
    end
    def insert(value)
        value_content = value
        value = Node.new(value_content)
        current_node = @root
        # found the leaf to insert the new node
        until current_node.left_child == nil && current_node.right_child == nil 
            if value.lower_than(current_node)
                if current_node.left_child != nil
                    current_node = current_node.left_child
                # case if the current node has just one child 
                # and is going to be inserted where theres nothing
                else 
                    break
                end
            else
                if current_node.right_child != nil
                    current_node = current_node.right_child
                else
                    break
                end
            end
        end
        # insert the new node
        if current_node.greater_than(value)
            current_node.left_child = value
        else
            current_node.right_child =  value
        end
    end
    def delete(value)
        # 1. finds the node and the connection of the node to the whole tree
        current_node = @root
        before_node = @root
        until current_node.value == value || current_node.value == value
            sleep(0.5)
            p current_node.value
            before_node = current_node
            if current_node.value < value
                current_node = current_node.right_child
            else
                current_node = current_node.left_child 
            end
        end
        # remove a leaf
        p "eliminate this:"
        p current_node.value
        if current_node.right_child == nil && current_node.left_child == nil
            if before_node.right_child == current_node
                before_node.right_child = nil
            elsif before_node.left_child == current_node
                before_node.left_child = nil
            end
        # remove with one children 
        elsif current_node.right_child == nil || current_node.left_child == nil
            if current_node.right_child == nil
                new_connection = current_node.left_child
            else
                new_connection = current_node.right_child
            end
            if before_node.right_child == current_node
                before_node.right_child = new_connection
            else before_node.left_child == current_node
                before_node.left_child = new_connection
            end
        # remove with two children
        end
    end
    def find(value)

    end
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
end

number_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

sorted_list = Tree.new(number_array)
sorted_list.build_tree
sorted_list.pretty_print


sorted_list.pretty_print
p sorted_list.delete(7)
puts "\deleted node"
sorted_list.pretty_print