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