function [y, Xa, Ya] = pixel_disp(img1, img2, x, y, support_window_size, search_area_size)
    
    [imgsizeX, imgsizeY, imgsizeZ] = size(img2);

    %create support window for left image
    left_sw = create_support_window(img1, x, y, support_window_size);

    %find start point for search area
    [sax,say] = top_left(x, y, search_area_size);
    if sax < 1
        sax = 1;
    end
    if say < 1
        say = 1;
    end

    disp_vec = -1;
    Xa = 0;
    Ya = 0;

    %for column start of search window till this end value
    for i = sax:(sax+search_area_size)
        if i > imgsizeX
            break
        end
        %for row start of search window till this end value
        for j = say:(say+search_area_size)
            if j > imgsizeY
                break
            end
            %create support window
            right_sw = create_support_window(img2, i, j, support_window_size);
            [rx, ry, rz] = size(right_sw);
            if rx == 10
                y=0;
            end
            %compare windows
            disp_vec2 = support_cmp(left_sw, right_sw);
            %save the values if the minimum difference is received

            if disp_vec == -1 || disp_vec > disp_vec2
                disp_vec = disp_vec2;
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
    y = disp_vec;
