function dm = fill_occlusions(disp_map)
    [rows, cols, depth] = size(disp_map);
    
    colour = 0;
    lowest = min(disp_map(:));
    
    % for each scanline in the image
    for r=1:rows
        % look through scanline and replace black pixels with last valid
        % colour
        for c=1:cols
            % if black replace pixel with last valid colour
            if(disp_map(r, c) == lowest)
                disp_map(r,c) = colour;
            else
                % else store value as the last valid colour
                colour = disp_map(r, c);
            end
        end
        
        colour = 0;
    end
    
    dm = disp_map;