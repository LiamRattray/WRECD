function y = support_cmp(w1, w2, size, loc1, loc2)

    i,j = top_left(loc1[0], loc1[1], size);
    one = imcrop(w1, [i, j, size, size]);
    i,j = top_left(loc2[0], loc2[1], size);
    two = imcrop(w2, [i, j, size, size]);
    
    s = one-two;
    ssd = sum(s(:).^2);
    y = ssd