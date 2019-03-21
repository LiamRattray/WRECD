function [disparity_map] = disp_map(img1, img2, support_window_size, search_area_h_size, search_area_v_size)
    %try to convert RGB images into grey one 
    try
        img1 = rgb2gray(img1);
        img2 = rgb2gray(img2);
    catch exception
    end
    %get image size
    [imgsizeY, imgsizeX] = size(img1);
    % create empty disparity map
    disparity_map = zeros(imgsizeY, imgsizeX);
    
    f = waitbar(0, "Generating disparity map");

    %loot through the image calculating the disparity map
    for i = 1:imgsizeX
        waitbar(i/imgsizeX, f, "Generating disparity map");
        for j = 1:imgsizeY
            [ssd, xa, ya, d] = pixel_disp(img1, img2, i, j, support_window_size, search_area_h_size, search_area_v_size);
            %movement along left/right
            disparity_map(j, i) = i-xa;
            search_area_h_size = abs(i-xa)*2 + 2;
        end
    end
    
    close(f);
    msgbox("Disparity map generated");