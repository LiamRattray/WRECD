function [disparity_mapX, disparity_mapY, disparity_map] = disp_map(img1, img2, support_window_size, search_area_h_size, search_area_v_size)
    %try to convert RGB images into grey one 
    try
        img1 = rgb2gray(img1);
        img2 = rgb2gray(img2);
    catch exception
    end
    %get image size
    [imgsizeY, imgsizeX] = size(img1);
    % create empty disparity map
    disparity_mapY = zeros(imgsizeY, imgsizeX);
    disparity_mapX = zeros(imgsizeY, imgsizeX);
    disparity_map = cell(imgsizeY, imgsizeX);
    
    f = waitbar(0, "Generating disparity map");

    %loot through the image calculating the disparity map
    for i = 30:imgsizeX-30
        waitbar(i/imgsizeX, f, "Generating disparity map");
        for j = 30:imgsizeY-30
            [ssd, xa, ya, d] = pixel_disp(img1, img2, i, j, support_window_size, search_area_h_size, search_area_v_size);
            %movement along left/right
            disparity_mapX(j, i) = i-xa;
            %movement along up/down
            disparity_mapY(j, i) = j-ya;
            %stores vectors and values
            disparity_map{j, i} = [d, ssd];
        end
    end
    
    close(f);
    msgbox("Disparity map generated");