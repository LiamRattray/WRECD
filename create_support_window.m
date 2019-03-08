function win = create_support_window(img, x, y, size)
    [i,j] = top_left(x, y, size);
    win = imcrop(img, [i, j, size, size]);