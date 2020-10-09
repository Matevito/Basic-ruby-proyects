def bubble_sort (num_list)
    loop do
        new_list = one_sort(num_list)
        
        break if new_list == num_list

        #actualize list 
        num_list = new_list
    end
    return num_list
end

def one_sort (num_list)
    #input: num_list; output: the result of one check with bubble sort method
    new_list = [num_list[0]]

    for i in (0..num_list.length-1)
        current_num = new_list.last
        right_num = num_list[i+1]

        #return when index = last_index; cause this means the list is complete
        return new_list if i == num_list.length-1

        if right_num < current_num
            new_list.pop
            new_list.push(right_num,current_num)
                
        else
            new_list.push(right_num)

        end
    end
end

print bubble_sort([4,3,78,2,0,2]) #output=> [0, 2, 2, 3, 4, 78]