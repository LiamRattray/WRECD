function [depth_map] = depth_map(disp_m, focal_length)
    [y, x] = size(disp_m)
    depth_map = zeros(y, x)
    baseline = 1000
    
    for j = 1:y
        for i = 1:x
            if disp_m(j, i) ~= 0
                depth_map(j, i) = (baseline*focal_length)./disp_m(j, i)
            end
        end    
    end
    