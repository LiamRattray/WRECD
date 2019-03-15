function win = create_support_window(img, x, y, ofsize)
    [i,j] = top_left(x, y, ofsize);
    [xx, yy, zz] = size(img);
    if i < ofsize || j < ofsize || i+ofsize > xx || j+ofsize > yy
        img = padarray(img,[100 100],'both');
        i = i + 100;
        j = j + 100;
    end
    win = imcrop(img, [i, j, ofsize, ofsize]);