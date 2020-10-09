def bubble_sort (num_list)
    is_sorted = true
    loop do
        new_list = [num_list[0]]
        for i in (0..num_list.length-1)
            current_num = new_list.last
            right_num = num_list[i+1]
            
            #break when index = last_index
            break if i == num_list.length-1
                

            if right_num < current_num
                new_list.pop
                new_list.push(right_num,current_num)
            else
                new_list.push(right_num)

            end
        end
        print new_list
        break
    end
end

bubble_sort([4,3,78,2,0,2])