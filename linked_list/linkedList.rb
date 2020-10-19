class Node
    @next_node = nil
    @value = nil
    attr_accessor :value, :next_node
end

class LinkedList
    @head = nil
    @tail = nil
    attr_reader :head, :tail, :size
    def append(value)
        value_content = value
        value = Node.new
        value.value = (value_content)
        if @head == nil
            @head = value
        else
            @tail.next_node = value
        end
        @tail = value
    end
    def prepend(value)
        value_content = value
        value = Node.new
        value.value = (value_content)
        value.next_node = @head
        @head = value
    end
    def size
        return 0 if @head == nil
        count = 1
        current_node = @head
        until current_node.next_node == nil
            count += 1
            current_node = current_node.next_node
        end
        return count
    end
    def at(index)
        current_node = @head
        until index == 0
            current_node = current_node.next_node
            index -= 1
        end
        return current_node
    end
    def pop
        current_node = @head
        until current_node.next_node == @tail
            current_node = current_node.next_node
        end
        current_node.next_node = nil
        @tail = current_node
    end

    def contains?(value)
        current_node = @head
        loop do
            if current_node.value == value
                return true
            elsif current_node.next_node == nil
                return false
            end
            current_node = current_node.next_node
        end
    end

    def find(value)
        if self.contains?(value)
            index = 0
            current_node = @head
            until current_node.value == value
                current_node = current_node.next_node
                index += 1
            end
            return index
        else
            return nil
        end
    end

    def to_s
        string = ""
        current_node = @head
        return nil if current_node.nil?

        until current_node.next_node == nil
            string = string + "(#{current_node.value}) ==> "
            current_node =  current_node.next_node
        end
        # append the tail in the string!
        string = string + "(#{current_node.value}) ==> nil"
        return string
    end

    #extra credit
    def insert_at(value, index)
        # create the node
        content_value = value
        value = Node.new
        value.value = content_value

        # conect the node in the list
        if index == 0
            value.next_node = @head
            @head = value
        else
            before_node = self.at(index-1)
            after_node = self.at(index)
            before_node.next_node = value
            value.next_node = after_node
            @tail = value if after_node == nil
        end
    end
    
end

list = LinkedList.new

list.append("12")
list.append(13)
list.prepend("holaaaa, ahora soy la cabeza")
list.append("im the tail of the list")
p "head: #{list.head.value}"
p "tail: #{list.tail.value}"
#p list.head.next_node
#p "size: #{list.size}"
p "content in 3: #{list.at(3).value}"

p"the list contain? #{list.contains?("holaaaa, ahora soy la cabeza")}"
p"the list contain? #{list.contains?("123")}"

puts "\n 13 index is:"
p list.find(13)
puts "\nlist to string: "
p "#{list.to_s}"

list.insert_at("new node", 1)

puts "\nnew list: "
p "#{list.to_s}"
