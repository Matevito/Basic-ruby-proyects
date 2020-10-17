#If we list all the natural numbers below 10 that are multiples of 
#3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.
def multiples(n)
    until (n % 3 == 0) || (n % 5 == 0)
        n -= 1
    end
    # base case
    return 3 if n == 3
    # recursive case
    n + multiples(n-1)
end

p multiples(1000) # => 234168