def merge(first_array, second_array)
    merged_list = []
    until second_array.length == 0 && first_array.length == 0
        # when one part is done
        if first_array.length == 0
            merged_list.push(second_array[0])
            second_array.shift
            next
        elsif second_array.length == 0
            merged_list.push(first_array[0])
            first_array.shift
            next
        end
        # compare the first numbers of each array
        first_number = first_array[0]
        second_number = second_array[0]

        if second_number > first_number
            merged_list.push(first_number)
            first_array.shift
        else
            merged_list.push(second_number)
            second_array.shift
        end
    end
    return merged_list
end

# p merge([2,4,6,8], [1,3,5,7])
def merge_sort(numbers)
    half_index = numbers.length / 2
    left_part = numbers[0..half_index - 1]
    right_part = numbers[half_index..numbers.length - 1]
    
    # check this! base case: length is...2 or 1?
    if right_part.length == 1
        return merge(left_part, right_part)
    elsif right_part.length == 2
        left_ = [right_part[0]] 
        right_ = [right_part[1]]
        sorted_rigth = merge(left_, right_)
        return merge(left_part, sorted_rigth)
    end

    #recursive_case
    left_side = merge_sort(left_part)
    right_side = merge_sort(right_part)
    merge(left_side, right_side)
end

#p merge_sort [3,4,78,99,1,11,15,2,6,44]
p merge_sort([3,4,78,99,11,15,2,6,44,8,1]) #=> [1, 2, 3, 4, 6, 8, 11, 15, 44, 78, 99]