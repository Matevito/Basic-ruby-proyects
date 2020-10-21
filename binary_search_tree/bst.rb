require_relative "tree_methods"

class Tree
    @root = nil
    attr_accessor :root, :list
    def initialize(list)
        @list = list
    end
    def build_tree(list = @list)
        # 1. remove duplicates
        new_list = []
        list.each do |element|
            unless new_list.include?(element)
                new_list.push(element)
            end
        end
        # 2. sort the elements
        list = new_list.sort

        # 3. make the tree
        @root = build_tree_(list)
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
            before_node = current_node
            if current_node.value < value
                current_node = current_node.right_child
            else
                current_node = current_node.left_child 
            end
        end
        # remove a leaf
        if current_node.right_child == nil && current_node.left_child == nil
            if before_node.right_child == current_node
                before_node.right_child = nil
            elsif before_node.left_child == current_node
                before_node.left_child = nil
            end
        # remove with one children 
        elsif current_node.right_child == nil || current_node.left_child == nil
            # map the new conection
            if current_node.right_child == nil
                new_connection = current_node.left_child
            else
                new_connection = current_node.right_child
            end
            #connect the before node with the new connection
            if before_node.right_child == current_node
                before_node.right_child = new_connection
            else before_node.left_child == current_node
                before_node.left_child = new_connection
            end
        # remove with two children :/ build a new tree
        elsif current_node.right_child != nil && current_node.left_child != nil
            sub_tree =  level_order_array(current_node)
            sub_tree.delete(current_node.value)
            new_tree = build_tree_(sub_tree.sort)
            if before_node.right_child == current_node
                before_node.right_child = new_tree
            else
                before_node.left_child = new_tree
            end
        end
    end
    def find(value)
        current_node = @root
        until current_node.value == value
            if current_node.value > value
                current_node = current_node.left_child
            else
                current_node = current_node.right_child
            end
        end
        return current_node
    end
    def level_order
        current_node = @root
        level_order_list = level_order_array(current_node)
        return level_order_list
    end
    def preorder(node = @root)
        ordered = []
        return [] if node.nil?
        ordered.push(node.value)
        ordered.concat(preorder(node.left_child))
        ordered.concat(preorder(node.right_child))
        return ordered
    end
    def postorder(node = @root)
        ordered = []
        return [] if node.nil?
        ordered.concat(preorder(node.left_child))
        ordered.concat(preorder(node.right_child))
        ordered.push(node.value)
        return ordered
    end
    def inorder(node = @root)
        ordered = []
        return [] if node.nil?
        ordered.concat(inorder(node.left_child))
        ordered.push(node.value)
        ordered.concat(inorder(node.right_child))
        return ordered
    end
    def height(node)
        # count start with -1 because the code always adds at least 1.
        count = -1
        queue = [node]
        until queue == []
            new_queue = []
            queue.each do |node|
                if node.left_child != nil
                    new_queue.push(node.left_child)
                end
                if node.right_child != nil
                    new_queue.push(node.right_child)
                end
            end
            queue = new_queue
            count += 1
        end
        return count
    end
    def depth(node)
        current_node = @root
        count = 0
        until current_node == node
            if current_node.value > node.value
                current_node = current_node.left_child
            else
                current_node = current_node.right_child
            end
            count += 1
        end
        return count
    end
    def balanced?
        check_list = inorder(@root)
        balanced = true
        # the loop will check all nodes height in it's left and right
        check_list.each do |node_value|
            current_node = find(node_value)
            # get left and right values
            if current_node.left_child == nil
                left_height = -1
            else
                left_height = height(current_node.left_child)
            end
            if current_node.right_child == nil
                right_height = -1
            else
                right_height = height(current_node.right_child)
            end
            # evaluate this values
            result = left_height - right_height
            if result < -1 || result > 1
                balanced = false
                break
            end
        end
        return balanced
    end
    def rebalance
        tree_list = level_order.sort
        build_tree(tree_list)
    end
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
end

# script test
tree_list = Array.new(15) { rand(1..100) }
binary_tree = Tree.new(tree_list)
binary_tree.build_tree
binary_tree.pretty_print
sleep(1.5)
puts "\nThe tree is balanced? #{binary_tree.balanced?}"

# elements in level, pre, post and in order
sleep(1.5)
puts "\ntree elements in level order: #{binary_tree.level_order}"
sleep(1.5)
puts "\ntree elements in preorder: #{binary_tree.preorder}"
sleep(1.5)
puts "\ntree elements in postorder: #{binary_tree.postorder}"
sleep(1.5)
puts "\ntree elements in inorder: #{binary_tree.inorder}"

# unbalance the tree
puts "\nUNBALANCING THE TREE: "
tries = rand(5..10)
tries.times do
    binary_tree.insert(rand(100..1000))
end
sleep(1.5)
binary_tree.pretty_print
puts "\nThe tree is balanced? #{binary_tree.balanced?}"

puts "\nBALANCING TREE..."
binary_tree.rebalance
sleep(1.5)
binary_tree.pretty_print
puts "\nThe tree is balanced? #{binary_tree.balanced?}"
sleep(1.5)
puts "\ntree elements in level order: #{binary_tree.level_order}"
sleep(1.5)
puts "\ntree elements in preorder: #{binary_tree.preorder}"
sleep(1.5)
puts "\ntree elements in postorder: #{binary_tree.postorder}"
sleep(1.5)
puts "\ntree elements in inorder: #{binary_tree.inorder}"