function [y, Xa, Ya, d] = pixel_disp(img1, img2, x, y, support_window_size, search_area_h_size, search_area_v_size)
    
    [img_rows, img_columns, imgsizeZ] = size(img2);

    %create support window for left image
    left_sw = create_support_window(img1, x, y, support_window_size);

    %find start point for search area
    [row, col] = top_left(x, y, search_area_h_size, search_area_v_size);
    if col < 1
        col = 1;
    end
    if row < 1
        row = 1;
    end

    min_ssd = -1;
    Xa = 0;
    Ya = 0;

    %for column start of search window till this end value
    for i = col:(col+search_area_h_size)
        if i >= img_columns
            break
        end
        %for row start of search window till this end value
        for j = row:(row+search_area_v_size)
            if j >= img_rows
                break
            end
            %create support window
            right_sw = create_support_window(img2, i, j, support_window_size);
%             [rx, ry, rz] = size(right_sw);
%             if rx == 10
%                 y=0;
%             end
            %compare windows
            curr_ssd = support_cmp(left_sw, right_sw);
            %save the values if the minimum difference is received

            if min_ssd == -1 || min_ssd > curr_ssd
                min_ssd = curr_ssd;
                Xa = i;
                Ya = j;
                %imshowpair(left_sw, right_sw, "montage")

            end
        end
    end
    %[xaxa, yaya] = top_left(Xa, Ya, support_window_size);
    %imshowpair(left_sw, imcrop(img2, [xaxa, yaya, support_window_size, support_window_size]), "montage")
    %Xa
    %Ya
    d = [x-Xa, y-Ya];
    y = min_ssd;
