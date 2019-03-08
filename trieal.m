function f = trieal()
    A = rand(3, 7).*10
    B = rand(7, 3).*10
    Bb = transpose(B)
    C = [A; Bb]