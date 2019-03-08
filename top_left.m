function [corx, cory] = top_left(x, y, winsize)
    top = y - winsize/2;
    left = x - winsize/2;
    corx=left;
    cory=top;