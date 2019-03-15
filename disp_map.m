function disparity_map = disp_map(img1, img2, support_window_size, search_area_size)
    %image size
    [imgsizeX, imgsizeY, imgsizeZ] = size(img1);
    % create empty disparity map
    disparity_map = zeros(imgsizeX, imgsizeY);

    % check that search area size is smaller than image
    
    % check that support window size is smaller than search area
    
    % loop through pixels of left image ignoring pixels where the support
    % window would go outside the image
    %for i = support_window_size:imgsizeX-support_window_size-1
    %    for j = support_window_size:imgsizeY-support_window_size-1
    for i = 0:imgsizeX-1
        for j = 0:imgsizeY-1
            try
                disparity_map(i, j) = pixel_disp(img1, img2, i, j, support_window_size, search_area_size);
            catch exception
                y=0;
            end
        end
    end