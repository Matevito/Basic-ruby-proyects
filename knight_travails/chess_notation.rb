def num_to_letter(number)
    case number
    when 0
        "a"
    when 1
        "b"
    when 2
        "c"
    when 3
        "d"
    when 4
        "e"
    when 5
        "f"
    when 6
        "g"
    when 7
        "h"
    end
end
def letter_to_number(letter)
    letter = letter.downcase
    case letter
    when "a"
        0
    when "b"
        1
    when "c"
        2
    when "d"
        3
    when "e"
        4
    when "f"
        5
    when "g"
        6
    when "h"
        7
    end
end
# todo: check why the last number does not transform to int with "to_i".
def int_to_chess(number_list)
    # if its just one element return an array inside an array
    chess_notation = []
    number_list.each do |square|
        square_notation = []
        letter = num_to_letter(square[0])
        number = square[1]
        square_notation.push(letter, number)
        chess_notation.push(square_notation)
    end
    # todo: flatten if theres only one element inside!
    chess_notation
end
def chess_to_int(square)
    # the code just transform one notation at a time
    square = square.split("")
    return[letter_to_number(square[0]), square[1]]
end