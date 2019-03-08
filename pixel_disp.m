function [y, Xa, Ya] = pixel_disp(img1, img2, x, y)
    
    support_window_size = 30;
    search_area_size = 100;
    
    [imgsizeX, imgsizeY] = size(img2);

    %create support window for left image
    left_sw = create_support_window(img1, x, y, support_window_size);
    
    %find start point for search area
    [sax,say] = top_left(x, y, search_area_size);
    
    disp_vec = -1;
    Xa = 0;
    Ya = 0;
    
    %for column start of search window till this end value
    for j = say:say+search_area_size
        if j > imgsizeY
            break
        end
        %for row start of search window till this end value
        for i = sax:sax+search_area_size
            if i > imgsizeX
                break
            end
            %create support window
            right_sw = create_support_window(img2, i, j, support_window_size);
            %compare windows
            disp_vec2 = support_cmp(left_sw, right_sw);
            %save the values if the minimum difference is received
            
            if disp_vec == -1 || disp_vec > disp_vec2
                disp_vec = disp_vec2;
                Xa = i;
                Ya = j;
            end
        end
    end
        imshowpair(left_sw, imcrop(img2, [55, 136, support_window_size, support_window_size]), "montage")
    Xa
    Ya
    y = disp_vec
    
  