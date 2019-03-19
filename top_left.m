function [corx, cory] = top_left(x, y, winsize)
    top = floor(y - winsize/2);
    left = floor(x - winsize/2);
    corx=left;
    cory=top;
