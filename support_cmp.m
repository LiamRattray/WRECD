function y = support_cmp(one, two)
    % calculate the disparity between two support windows
    meanIntensityValue = mean2(one);
    meanIntensityValue2 = mean2(two);
    
    % minus the average from each value
    one_minus_average = double(one) - meanIntensityValue;
    two_minus_average = double(two) - meanIntensityValue2;
    
    % square (values - averages) and sum them
    %sd_one = sum(one_minus_average(:).^2);
    %sd_two = sum(two_minus_average(:).^2);
    
    % determine n
    %[win_x, win_y] = size(one);
    %n = win_x * win_y;
    
    % divide by n and get square root to give standard deviation for each
    % window
    %standard_dev_one = sqrt(sd_one/n);
    %standard_dev_two = sqrt(sd_two/n);
    
    % product of the SDs
    %product = standard_dev_one * standard_dev_two;
    
    % calculate difference between windows and square them
    difference = double(one_minus_average)-double(two_minus_average);
    squared_diffs = difference().^2;
    
    % Standard Deviation
    %variance = mean(squared_diffs(:));
    %standard_dev = sqrt(variance);
    
    % calculate regular ssd
    ssd = sum(squared_diffs(:));
    
    %calculate normalised ssd by dividing by product of SDs
    sdev = std2(one_minus_average);
    sdev2 = std2(two_minus_average);
    
    y = ssd/(sdev*sdev2);
    
    %difference = double(one) - double(two);
    %absolute = abs(difference);
    %y = sum(absolute(:));