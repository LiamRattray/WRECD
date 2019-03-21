function [corx, cory] = top_left(x, y, horizont_size, vertical_size)
    %calculate the top left coordinates with [x,y] pixel in the middle and
    %parsed horizont and vertical dimensions
    top = floor(y - vertical_size/2);
    left = floor(x - horizont_size/2);
    corx=left;
    cory=top;
