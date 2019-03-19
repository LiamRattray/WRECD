function [disparity_mapX, disparity_mapY] = disp_map(img1, img2, support_window_size, search_area_size)
    %image size
    [imgsizeX, imgsizeY, imgsizeZ] = size(img1);
    % create empty disparity map
    disparity_mapX = zeros(imgsizeX, imgsizeY);
    disparity_mapY = zeros(imgsizeX, imgsizeY);
    %disparity_map = cell(imgsizeX, imgsizeY);

    % check that search area size is smaller than image
    
    % check that support window size is smaller than search area
    
    % loop through pixels of left image ignoring pixels where the support
    % window would go outside the image
    %for i = support_window_size:imgsizeX-support_window_size-1
    %    for j = support_window_size:imgsizeY-support_window_size-1
    for i = 1:imgsizeX
        for j = 1:imgsizeY
            [ssd, xa, ya, d] = pixel_disp(img1, img2, i, j, support_window_size, search_area_size);
            disparity_mapX(i, j) = i-xa;
            disparity_mapY(i, j) = j-ya;
        end
    end