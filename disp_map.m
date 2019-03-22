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
    for j = 1:imgsizeY
        waitbar(j/imgsizeY, f, "Generating disparity map");
        for i = 1:imgsizeX
            [ssd, xa, ya, d] = pixel_disp(img1, img2, i, j, support_window_size, search_area_h_size, search_area_v_size);
            %movement along left/right
            
            if (ssd < 30)
                disparity_map(j, i) = i-xa;
            else
                if i == 1
                     disparity_map(j, i) = 0;
                else
                    disparity_map(j, i) = disparity_map(j, i-1);
                end
            end
            
            search_area_h_size = abs(i-xa)*2 + 4;
            
            if search_area_h_size > 30
                search_area_h_size = 30;
            end
            if search_area_h_size < 10
                search_area_h_size = 10;
            end
        end
    end
    
    close(f);
    msgbox("Disparity map generated");