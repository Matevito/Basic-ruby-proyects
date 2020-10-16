# iteration
def fibs(number)
    fibonacci = [0,1]
    # this is just to return the exact
    # number of the fibonacci sequense stated in the input
    number -= 2
    until number == 0
        last_n = fibonacci.last
        second_last = fibonacci[-2]
        new_number = last_n + second_last
        fibonacci.push(new_number)
        number -= 1
    end
    return fibonacci
end

# recursion
def fibs_rec(fib =[0,1], n)
    # base case
    return [] if n <= 0

    # recursive case
    new_last = fib.last+fib.first
    new_check = [fib.last, new_last]
    [fib[0]] + fibs_rec(new_check, n-1)
end

p fibs_rec(8) # =>  [0, 1, 1, 2, 3, 5, 8, 13]