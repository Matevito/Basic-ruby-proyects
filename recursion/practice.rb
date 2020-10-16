def append_(number)
    return [number] if number == 0
    [number] + append_(number-1) 
end
p append_(5)

def inverse_append(n)
    return [n] if n == 0
    inverse_append(n-1) + [n]
end
p inverse_append(8)