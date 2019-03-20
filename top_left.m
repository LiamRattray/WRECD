function [corx, cory] = top_left(x, y, horizont_size, vertical_size)
    top = floor(y - vertical_size/2);
    left = floor(x - horizont_size/2);
    corx=left;
    cory=top;
