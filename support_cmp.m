function y = support_cmp(one, two)

    s = double(one)-double(two);
    ssd = sum(s(:).^2);
    y = ssd;