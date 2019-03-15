function [corx, cory] = top_left(x, y, winsize)
    top = y - winsize/2;
    left = x - winsize/2;
    corx=left;
    cory=top;
    if corx < 0
        corx = 0;
    end
    if cory < 0 
        cory = 0;
    end
