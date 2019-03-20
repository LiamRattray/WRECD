function win = create_support_window(img, x, y, ofsize)
    [i,j] = top_left(x, y, ofsize, ofsize);
    [yy, xx] = size(img);
    if i <= ofsize || j <= ofsize || i+ofsize >= xx || j+ofsize >= yy
        img = padarray(img,[ofsize ofsize],'both');
        i = i + ofsize;
        j = j + ofsize;
    end
    win = imcrop(img, [i, j, ofsize, ofsize]);