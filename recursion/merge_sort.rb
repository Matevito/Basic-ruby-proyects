def merge(first_array, second_array)
    merged_list = []
    while second_array.length != 0 && first_array.length != 0
        # when one part is done
        if first_array.length == 0
            merged_list.push(second_array[0])
            second_array.shift
        elsif second_array.length == 0
            merged_list.push(first_array[0])
            first_array.shift
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

p merge([2,4,6,8], [1,3,5,7])
def merge_sort(numbers)
    half_index = numbers.length / 2
    left_part = numbers[0..half_index - 1]
    right_part = numbers[half_index..numbers.length - 1]
    
    # base case: length is...2 or 1?


end
#number_list = [1,3,4,78,99,11,15,2,6,4,8]
#p merge_sort [1,3,4,78,99,11,15,2,6,4]
#p merge_sort(number_list)